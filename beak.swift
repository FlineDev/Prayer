#!/usr/bin/env beak run

// MARK: - Script Dependencies
// beak: kareman/SwiftShell @ .upToNextMajor(from: "4.1.2")
// beak: onevcat/Rainbow @ .upToNextMajor(from: "3.1.2")

import Foundation
import Rainbow
import SwiftShell

// MARK: - Runnable Tasks
/// Makes sure all Swift files in the Scripts folder can be run as executables without the `.swift` extension or `beak run` prefix.
public func link() throws {
    let scriptsDirUrl = URL(fileURLWithPath: FileManager.default.currentDirectoryPath).appendingPathComponent("Scripts")
    let symlinksDirUrl = scriptsDirUrl.appendingPathComponent("SymLinks")

    if !FileManager.default.fileExists(atPath: symlinksDirUrl.path) {
        try execute(bash: "mkdir \(symlinksDirUrl.path)")
    }

    for filePath in try FileManager.default.contentsOfDirectory(atPath: scriptsDirUrl.path) {
        guard filePath.hasSuffix(".swift") else { continue } // skip if not a Swift file

        let fileUrl = scriptsDirUrl.appendingPathComponent(filePath)
        let toolName = fileUrl.lastPathComponent.replacingOccurrences(of: ".swift", with: "")
        let symlinkUrl = symlinksDirUrl.appendingPathComponent(toolName)

        try execute(bash: "chmod +x \(fileUrl.path)")

        if !FileManager.default.fileExists(atPath: symlinkUrl.path) {
            try execute(bash: "ln -s \(fileUrl.path) \(symlinkUrl.path)")
        }
    }

    for bashConfigFile in [".bash_profile", ".bashrc"] {
        let bashConfigUrl = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent(bashConfigFile)
        let direnvLine = "eval \"$(direnv hook bash)\""

        if FileManager.default.fileExists(atPath: bashConfigUrl.path) && run(bash: "grep '\(direnvLine)' \(bashConfigUrl.path)").stdout.isEmpty {
            try execute(bash: "echo '\(direnvLine)' >> \(bashConfigUrl.path)")
            try execute(bash: "source \(bashConfigUrl.path)")
        }
    }

    try execute(bash: "direnv allow .")
    try execute(bash: "direnv reload")
}

// MARK: - Helpers
private func execute(bash command: String) throws {
    print("⏳ Executing '\(command.italic.lightYellow)'".bold)
    try runAndPrint(bash: command)
}
