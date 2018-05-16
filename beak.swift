// beak: kareman/SwiftShell @ .upToNextMajor(from: "4.0.1")
// beak: kylef/PathKit @ .upToNextMajor(from: "0.9.0")
// beak: onevcat/Rainbow @ .upToNextMajor(from: "3.0.3")
// beak: Flinesoft/HandySwift @ .upToNextMajor(from: "2.6.0")

import HandySwift
import Foundation
import SwiftShell
import PathKit
import Rainbow

// MARK: - Helpers
private func deleteFile(_ fileName: String) throws {
    let command = "[ ! -e \(fileName) ] || rm \(fileName)"
    print("Deleting file '\(fileName)': '\(command)'", level: .info)
    try runAndPrint(bash: command)
}

private func renameProject(from oldName: String, to newName: String) throws {
    var filesToReplaceContent: [Path] = [
        Path(oldName + ".xcodeproj/project.pbxproj"),
        Path(oldName + ".xcodeproj/project.xcworkspace/contents.xcworkspacedata"),
        Path(oldName + ".xcodeproj/project.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings"),
        Path(oldName + ".xcodeproj/xcshareddata/xcschemes/\(oldName).xcscheme")
    ]

    filesToReplaceContent += Path.glob("Sources/**/*.swift")
    filesToReplaceContent += Path.glob("Tests/**/*.swift")
    filesToReplaceContent += Path.glob("UI Tests/**/*.swift")

    try filesToReplaceContent.forEach { swiftFilePath in
        try replaceInFile(fileUrl: swiftFilePath.url, regex: try Regex(oldName), replacement: newName)
    }

    let oldSchemePath = "\(oldName).xcodeproj/xcshareddata/xcschemes/\(oldName).xcscheme"
    let newSchemePath = "\(oldName).xcodeproj/xcshareddata/xcschemes/\(newName).xcscheme"
    try runAndPrint(bash: "mv \(oldSchemePath) \(newSchemePath)")
    try runAndPrint(bash: "mv \(oldName).xcodeproj/ \(newName).xcodeproj/")
}

private func replaceInFile(fileUrl: URL, regex: Regex, replacement: String) throws {
    print("Replacing occurences of regex '\(regex)' in file '\(fileUrl.lastPathComponent)' with '\(replacement)' ...", level: .info)
    var content = try String(contentsOf: fileUrl, encoding: .utf8)
    content = regex.replacingMatches(in: content, with: replacement)
    try content.write(to: fileUrl, atomically: false, encoding: .utf8)
}

private func replaceInFile(fileUrl: URL, substring: String, replacement: String) throws {
    print("Replacing occurences of substring '\(substring)' in file '\(fileUrl.lastPathComponent)' with '\(replacement)' ...", level: .info)
    var content = try String(contentsOf: fileUrl, encoding: .utf8)
    content = content.replacingOccurrences(of: substring, with: replacement)
    try content.write(to: fileUrl, atomically: false, encoding: .utf8)
}

private enum Tool: String {
    case homebrew = "brew"
    case bartycrouch
    case carthage

    var isMissing: Bool {
        return run("which", rawValue).stdout.isEmpty
    }

    func install() throws {
        switch self {
        case .homebrew:
            let installCommand = "/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
            print("Installing Homebrew: '\(installCommand)'", level: .info)
            try runAndPrint(bash: installCommand)

        default:
            try installViaHomebrew()
        }
    }

    private func installViaHomebrew() throws {
        let installCommand = "brew install \(rawValue)"
        print("Installing \(rawValue) via Homebrew: '\(installCommand)'", level: .info)
        try runAndPrint(bash: installCommand)
    }
}

private enum PrintLevel {
    case info
    case warning
    case error
}

private func print(_ message: String, level: PrintLevel) {
    switch level {
    case .info:
        print("ℹ️ ", message.lightBlue)

    case .warning:
        print("⚠️ ", message.yellow)

    case .error:
        print("❌ ", message.red)
    }
}

private func installMissingTools(_ tools: [Tool]) throws {
    if Tool.homebrew.isMissing {
        try Tool.homebrew.install()
    }

    try tools.filter { $0.isMissing }.forEach { try $0.install() }
}

private let semanticVersionRegex = try Regex("(\\d+)\\.(\\d+)\\.(\\d+)\\s")

private struct SemanticVersion: Comparable, CustomStringConvertible {
    let major: Int
    let minor: Int
    let patch: Int

    init(_ string: String) {
        guard let captures = semanticVersionRegex.firstMatch(in: string)?.captures else {
            fatalError("SemanticVersion initializer was used without checking the structure.")
        }

        major = Int(captures[0]!)!
        minor = Int(captures[1]!)!
        patch = Int(captures[2]!)!
    }

    static func < (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        guard lhs.major == rhs.major else { return lhs.major < rhs.major }
        guard lhs.minor == rhs.minor else { return lhs.minor < rhs.minor }
        return lhs.patch < rhs.patch
    }

    static func == (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        return lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch == rhs.patch
    }

    var description: String {
        return "\(major).\(minor)"
    }
}

private func appendEntryToCartfile(_ tagline: String?, _ githubSubpath: String, _ version: String) throws {
    let comment = tagline != nil ? "# \(tagline!)\n" : ""
    let repoSpecifier = "github \"\(githubSubpath)\""
    let versionSpecifier: String = {
        guard version != "latest" else {
            let tagListCommand = "git ls-remote --tags https://github.com/\(githubSubpath).git"
            let commandOutput = run(bash: tagListCommand).stdout
            let availableSemanticVersions = semanticVersionRegex.matches(in: commandOutput).map { SemanticVersion($0.string) }
            guard !availableSemanticVersions.isEmpty else {
                print("Dependency '\(githubSubpath)' has no tagged versions.", level: .error)
                fatalError()
            }
            let latestVersion = availableSemanticVersions.sorted().last!
            return " ~> \(latestVersion)"
        }

        return " ~> \(version)"
    }()

    let textToAddToCartfile = "\n\(comment)\(repoSpecifier)\(versionSpecifier)\n"

    let command = "echo '\(textToAddToCartfile)' >> Cartfile"
    print("Adding entry to Cartfile with: '\(command)'", level: .info)
    try runAndPrint(bash: command)
}

private func fetchGitHubTagline(subpath: String) throws -> String? {
    let taglineRegex = try Regex("<title>[^\\:]+\\: (.*)<\\/title>")
    let url = URL(string: "https://github.com/\(subpath)")!
    let html = try String(contentsOf: url, encoding: .utf8)
    guard let firstMatch = taglineRegex.firstMatch(in: html) else { return nil }
    guard let firstCapture = firstMatch.captures.first else { return nil }
    return firstCapture!
}

private func pathOfXcodeProject() -> Path {
    return Path.current.glob("*.xcodeproj").first!
}

typealias Framework = (identifier: String, name: String)

private func pbxProjectFilePath() -> Path {
    return pathOfXcodeProject() + Path("project.pbxproj")
}

private func pbxProjectFileContent() throws -> String {
    return try pbxProjectFilePath().read(.utf8)
}

private func appFrameworks() throws -> [Framework] {
    let frameworkInfoRegex = try Regex("\\s*(\\S{24}) \\/\\* ([^\\*]+) \\*\\/,")

    let appFrameworksRegex = try Regex("A1494AF81E27F56300286EBF \\/\\* App \\*\\/ = \\{\\s*isa = PBXGroup;[^\\(]*children = \\(((?:\\s*\\S{24} \\/\\* [^\\*]+ \\*\\/,)*)")
    let appFrameworksContent = appFrameworksRegex.firstMatch(in: try pbxProjectFileContent())!.captures.first!!
    return frameworkInfoRegex.matches(in: appFrameworksContent).map { (identifier: $0.captures[0]!, name: $0.captures[1]!) }
}

private func newFrameworkCopyContent(frameworks: [Framework]) throws -> String {
    return "\n" + frameworks.map { "\t\t\t\t\"$(SRCROOT)/Carthage/Build/iOS/\($0.name)\"," }.joined(separator: "\n")
}

private struct CartfileEntry: CustomStringConvertible {
    let commentLine: String?
    let dependencyDefinitionLine: String

    var description: String {
        guard let commentLine = commentLine else { return dependencyDefinitionLine }
        return [commentLine, dependencyDefinitionLine].joined(separator: "\n")
    }
}

// MARK: - Tasks
/// Installs project dependencies.
public func installDependencies() throws {
    try installMissingTools([.carthage])

    let command = "carthage bootstrap --platform ios --cache-builds"
    print("Installing dependencies via Carthage: '\(command)'", level: .info)
    try runAndPrint(bash: command)
}

/// Updates project dependencies.
public func updateDependencies() throws {
    try installMissingTools([.carthage])

    let command = "carthage update --platform ios --cache-builds"
    print("Updating dependencies via Carthage: \(command)", level: .info)
    try runAndPrint(bash: command)
}

/// Adds a dependency using the configured package manager.
public func addDependency(github githubSubpath: String, version: String = "latest") throws {
    try installMissingTools([.carthage])
    let tagline = try fetchGitHubTagline(subpath: githubSubpath)
    try appendEntryToCartfile(tagline, githubSubpath, version)
    try sortCartfile()
    try updateDependencies()

    print("Please add the new frameworks to your projects 'Carthage >> App' group in the project navigator, then run the following command:", level: .warning)
    print("beak run synchronizeDependencies", level: .warning)

    run(bash: "open -a Finder Carthage/Build/iOS/")
}

/// Synchronizes dependencies in project navigator and other places in the project file.
public func synchronizeDependencies() throws {
    let appTargetFrameworks = try appFrameworks()

    let frameworkCopyRegex = try Regex("A1494AF51E27F49200286EBF \\/\\* Carthage \\*\\/ = \\{[^\\(]*\\(\\s*\\)\\;\\s*inputPaths = \\(((?:\\s*.\\$\\(SRCROOT\\)[^\\)\\s]*)*)\\s*\\)\\;")
    let frameworkCopyContent = frameworkCopyRegex.firstMatch(in: try pbxProjectFileContent())!.captures.first!!
    let newContent = try newFrameworkCopyContent(frameworks: appTargetFrameworks)
    try replaceInFile(fileUrl: pbxProjectFilePath().url, substring: frameworkCopyContent, replacement: newContent)
}

/// Sorts the contents of Cartfile and Cartfile.private.
public func sortCartfile() throws {
    let dependecyLineRegex = try Regex("#? ?(?:github|binary|git) \"[^\"]+/([^\"]+)\".*")

    try ["Cartfile", "Cartfile.private"].forEach { fileName in
        let cartfileContents = try String(contentsOfFile: fileName)
        let cartfileLines = cartfileContents.components(separatedBy: .newlines).filter { !$0.isBlank }

        var temporaryComment: String?
        let cartfileEntries: [CartfileEntry] = cartfileLines.compactMap { line in
            if dependecyLineRegex.matches(line) {
                let newEntry = CartfileEntry(commentLine: temporaryComment, dependencyDefinitionLine: line)
                temporaryComment = nil
                return newEntry
            } else {
                temporaryComment = line
                return nil
            }
        }

        let compareClosure = { (lhs: CartfileEntry, rhs: CartfileEntry) -> Bool in
            let lhsDependencyName = dependecyLineRegex.firstMatch(in: lhs.dependencyDefinitionLine)!.captures.first!!.lowercased()
            let rhsDependencyName = dependecyLineRegex.firstMatch(in: rhs.dependencyDefinitionLine)!.captures.first!!.lowercased()
            return lhsDependencyName < rhsDependencyName
        }

        let sortedCartfilEntries = cartfileEntries.sorted(by: compareClosure, stable: false)
        let newCartfileContents = sortedCartfilEntries.map { $0.description }.joined(separator: "\n\n") + "\n"
        try newCartfileContents.write(toFile: fileName, atomically: false, encoding: .utf8)
    }
}
