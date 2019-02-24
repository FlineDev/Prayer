#!/usr/bin/env beak run --path

// MARK: - Script Dependencies
// beak: kareman/SwiftShell @ .upToNextMajor(from: "4.1.2")
// beak: onevcat/Rainbow @ .upToNextMajor(from: "3.1.2")

import Foundation
import Rainbow
import SwiftShell

// MARK: - Runnable Tasks
/// Updates all dependencies specified in the project according to their version requirements.
public func update() throws {
    if FileManager.default.fileExists(atPath: "Cartfile") {
        try execute(bash: "carthage update --platform ios --cache-builds")
    }

    if FileManager.default.fileExists(atPath: "Podfile") {
        try execute(bash: "pod update")
    }
}

/// Installs all dependencies with the exact versions specified on last update.
public func install() throws {
    if FileManager.default.fileExists(atPath: "Cartfile.resolved") {
        try execute(bash: "carthage bootstrap --platform ios --cache-builds")
    }

    if FileManager.default.fileExists(atPath: "Podfile.lock") {
        try execute(bash: "pod install")
    }
}

// MARK: - Helpers
private func execute(bash command: String) throws {
    print("⏳ Executing '\(command.italic.lightYellow)'".bold)
    try runAndPrint(bash: command)
}
