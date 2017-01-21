//
//  RakahComponent.swift
//  Prayer
//
//  Created by Cihat Gündüz on 10.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import HandySwift

typealias Duration = DispatchTimeInterval

/// A single unit a rakah can consists of.
class RakahComponent {
    // MARK: - Stored Type Properties

    static let lineChangeDuration = Duration.milliseconds(1_250)
    static let durationPerCharacter = Duration.milliseconds(55)
    static let movementSoundInstruments = [
        "Baroque Organ", "Bleep City", "Erhu", "Flow Motion", "Grand Piano with Pad & Choir", "Infinite Space",
        "Persian Santoor", "Soft Waves", "Turkish Saz Zither", "Tweed Picked Synth"
    ]


    // MARK: - Computed Type Properties

    static var movementSoundInstrument: String {
        get {
            if let instrument = UserDefaults.standard.string(forKey: "MovementSoundInstrument") {
                return instrument
            }
            return "Baroque Organ"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "MovementSoundInstrument")
            UserDefaults.standard.synchronize()
        }

    }


    // MARK: - Stored Instance Properties

    let name: String
    let spokenTextLines: [String]
    let needsMovement: Bool
    let movementIcon: UIImage?
    let movementSoundUrl: URL?

    let l10n = L10n.RakahComponent.self


    // MARK: - Initializers

    init(_ component: Rakah.Component) {
        var subdirectory: String? = nil

        switch component {
        case .takbir(let type):
            name = l10n.Takbir.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Takbir")
            needsMovement = true

            switch type {
            case .enclosing:
                movementIcon = nil
                subdirectory = "G-Short"
            case .up:
                movementIcon = #imageLiteral(resourceName: "up_arrow")
                subdirectory = "E-Short"
            case .upSpecial:
                movementIcon = #imageLiteral(resourceName: "up_arrow")
                subdirectory = "E-Long"
            case .down:
                movementIcon = #imageLiteral(resourceName: "down_arrow")
                subdirectory = "C-Short"
            case .downSpecial:
                movementIcon = #imageLiteral(resourceName: "down_arrow")
                subdirectory = "C-Long"
            }
        case .openingSupplication:
            name = l10n.OpeningSupplication.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Opening-Supplication")
            needsMovement = false
            movementIcon = nil
        case .taawwudh:
            name = l10n.Taawwudh.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Taawwudh")
            needsMovement = false
            movementIcon = nil
        case .recitation(fileName: let fileName):
            let l10n = L10n.Recitation.self

            switch fileName {
            case "001_The-Opening":
                name = l10n.TheOpening.name
            case "103_The-Flight-of-Time":
                name = l10n.TheFlightOfTime.name
            case "104_The-Slanderer":
                name = l10n.TheSlanderer.name
            case "105_The-Elephant":
                name = l10n.TheElephant.name
            case "106_Quraysh":
                name = l10n.Quraysh.name
            case "107_Assistance":
                name = l10n.Assistance.name
            case "108_Good-in-Abundance":
                name = l10n.GoodInAbundance.name
            case "109_Those-Who-Deny-the-Truth":
                name = l10n.ThoseWhoDenyTheTruth.name
            case "110_Succour":
                name = l10n.Succour.name
            case "111_The-Twisted-Strands":
                name = l10n.TheTwistedStrands.name
            case "112_The-Declaration-of-Gods-Perfection":
                name = l10n.TheDecleratiionOfGodsPerfection.name
            case "113_The-Rising-Dawn":
                name = l10n.TheRisingDawn.name
            case "114_Men":
                name = l10n.Men.name
            default: preconditionFailure()
            }
            spokenTextLines = RakahComponent.readLinesFromFile(named: fileName)
            needsMovement = false
            movementIcon = nil
        case .ruku:
            name = l10n.Ruku.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Ruku")
            needsMovement = false
            movementIcon = nil
        case .straighteningUp:
            name = l10n.StraighteningUp.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Straightening-Up")
            needsMovement = true
            movementIcon = #imageLiteral(resourceName: "up_arrow")
            subdirectory = "E-Short"
        case .sajdah:
            name = l10n.Sajdah.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Sajdah")
            needsMovement = false
            movementIcon = nil
        case .tashahhud:
            name = l10n.Tashahhud.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Tashahhud")
            needsMovement = false
            movementIcon = nil
        case .salatulIbrahimiyyah:
            name = l10n.SalatulIbrahimiyyah.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Salatul-Ibrahimiyyah")
            needsMovement = false
            movementIcon = nil
        case .rabbanagh:
            name = l10n.Rabbanagh.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Rabbanagh")
            needsMovement = false
            movementIcon = nil
        case .salam(let type):
            name = l10n.Salam.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Salam")
            needsMovement = true
            subdirectory = "G-Short"
            
            switch type {
            case .right: movementIcon = #imageLiteral(resourceName: "right_arrow")
            case .left: movementIcon = #imageLiteral(resourceName: "left_arrow")
            }
        }

        if let subdirectory = subdirectory {
            movementSoundUrl = Bundle.main.url(
                forResource: RakahComponent.movementSoundInstrument,
                withExtension: "caf",
                subdirectory: subdirectory
            )
        } else {
            movementSoundUrl = nil
        }
    }

    // MARK: - Type Methods

    private static func readLinesFromFile(named name: String) -> [String] {
        let spokenTextFilePath = Bundle.main.url(forResource: name, withExtension: "txt")!
        let contentString = try! String(contentsOf: spokenTextFilePath, encoding: .utf8)
        return contentString.strip.components(separatedBy: .newlines)
    }
}


// MARK: - Sub Types

extension Duration {
    var timeInterval: TimeInterval {
        switch self {
        case .seconds(let seconds):
            return Double(seconds)
        case .milliseconds(let milliseconds):
            return Double(milliseconds) / 1_000
        case .microseconds(let microseconds):
            return Double(microseconds) / 1_000_000
        case .nanoseconds(let nanoseconds):
            return Double(nanoseconds) / 1_000_000_000
        }
    }
}

extension String {
    var estimatedReadingTime: TimeInterval {
        return RakahComponent.durationPerCharacter.timeInterval * Double(utf8.count)
    }
}
