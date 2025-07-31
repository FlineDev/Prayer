#!/usr/bin/env beak run --path

// MARK: - Script Dependencies
// beak: kareman/SwiftShell @ .upToNextMajor(from: "4.1.2")
// beak: onevcat/Rainbow @ .upToNextMajor(from: "3.1.2")

import Foundation
import Rainbow
import SwiftShell

// MARK: - Runnable Tasks
/// Installs missing tools and updates existing ones required for the project.
public func install() throws {
   for tool in Constants.homebrewTools {
      if run(bash: "which \(tool.command)").stdout.isEmpty {
         try execute("brew install \(tool.name)")
      } else {
         do {
            try execute("brew upgrade \(tool.name)")
         } catch {
            if error is CommandError {
               // version is already up-to-date, do nothing
            } else {
               throw error
            }
         }
      }
   }

   for tool in Constants.homebrewCasks {
      if run(bash: "which \(tool.command)").stdout.isEmpty {
         try execute("brew cask install \(tool.name)")
      } else {
         do {
            try execute("brew cask upgrade \(tool.name)")
         } catch {
            if error is CommandError {
               // version is already up-to-date, do nothing
            } else {
               throw error
            }
         }
      }
   }

   for tool in Constants.gemTools {
      if run(bash: "which \(tool.command)").stdout.isEmpty {
         try execute("gem install \(tool.name)")
      } else {
         try execute("gem install \(tool.name)")
      }
   }
}

// MARK: - Helpers
private func execute(_ command: String) throws {
   print("⏳ Executing '\(command.italic.lightYellow)'".bold)
   try runAndPrint(bash: command)
}

private struct Tool {
   let name: String
   let command: String

   init(name: String, command: String? = nil) {
      self.name = name
      self.command = command ?? name
   }
}

private enum Constants {
   static let homebrewTools: [Tool] = [
      Tool(name: "bartycrouch"),
      Tool(name: "swiftlint"),
      Tool(name: "swiftgen"),
      Tool(name: "swiftlint"),
      Tool(name: "carthage"),
   ]

   static let homebrewCasks: [Tool] = [
      Tool(name: "periphery")
   ]

   static let gemTools: [Tool] = [
      Tool(name: "cocoapods", command: "pod")
   ]
}
