#!/usr/bin/env beak run --path

// MARK: - Script Dependencies
// beak: kareman/SwiftShell @ .upToNextMajor(from: "4.1.2")
// beak: onevcat/Rainbow @ .upToNextMajor(from: "3.1.2")

import Foundation
import Rainbow
import SwiftShell

// MARK: - Runnable Tasks
/// Installs all tools and dependencies required to build the project.
public func install() throws {
   try execute(bash: "tools install")
   try execute(bash: "deps install")
   try openXcodeProject()
}

/// Initially configures the project from the NewProjectTemplate from GitHub. Only use once when creating a new project.
public func setup(name: String, orga: String) throws {
   // delete unnecessary files
   for fileToDelete in ["README.md", "LICENSE", "Logo.png"] {
      try execute(bash: "rm \(fileToDelete)")
   }

   // rename sample files to be actual files
   for sampleFile in ["README.md.sample", "LICENSE.sample"] {
      try execute(bash: "mv \(sampleFile) \(sampleFile.replacingOccurrences(of: ".sample", with: ""))")
   }

   // replace name & orga in project file contents
   try replaceFileContentOccurences(of: "NewProjectTemplate", with: name)
   try replaceFileContentOccurences(of: "Jamit Labs GmbH", with: orga)

   // rename files with new name
   try execute(bash: "mv NewProjectTemplate.xcodeproj \(name).xcodeproj")

   // install tools, update dependencies & open project
   try execute(bash: "tools install")
   try execute(bash: "deps update")
   try openXcodeProject()
}

// MARK: - Helpers
private func execute(bash command: String) throws {
   print("⏳ Executing '\(command.italic.lightYellow)'".bold)
   try runAndPrint(bash: command)
}

private func replaceFileContentOccurences(of stringToReplace: String, with replacement: String) throws {
   try execute(bash: "LC_ALL=C find . -d 1 -type f -exec sed -i '' 's/\(stringToReplace)/\(replacement)/g' {} \\;")

   for subfolder in ["App", "Tests", "UITests", "NewProjectTemplate.xcodeproj"] {
      try execute(bash: "LC_ALL=C find . -regex '\\./\(subfolder)/.*' -type f -exec sed -i '' 's/\(stringToReplace)/\(replacement)/g' {} \\;")
   }
}

private func openXcodeProject() throws {
   let xcodeWorkspaces = run(bash: "find . -d 1 -regex '.*\\.xcworkspace' -type d").stdout.components(separatedBy: .newlines).filter { !$0.isEmpty }
   let xcodeProjects = run(bash: "find . -d 1 -regex '.*\\.xcodeproj' -type d").stdout.components(separatedBy: .newlines).filter { !$0.isEmpty }

   if let workspacePath = xcodeWorkspaces.first {
      try execute(bash: "open \(workspacePath)")
   } else if let projectPath = xcodeProjects.first {
      try execute(bash: "open \(projectPath)")
   } else {
      print("Could not find any Xcode Project for automatic opening.")
   }
}
