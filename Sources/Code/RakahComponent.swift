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
    static let durationPerCharacter = Timespan.milliseconds(55)

    // MARK: - Computed Type Properties
    static var movementSoundInstrument: String {
        get {
            guard let instrument = UserDefaults.standard.string(forKey: "MovementSoundInstrument") else { return "Baroque Organ" }
            return instrument
        }

        set {
            UserDefaults.standard.set(newValue, forKey: "MovementSoundInstrument")
            UserDefaults.standard.synchronize()
        }
    }

    // MARK: - Stored Instance Properties
    let name: String
    let chapterNumber: Int?
    let spokenTextLines: [String]
    let needsMovement: Bool
    let position: Position
    let movementSound: String?
    let isChangingText: Bool

    let l10n = L10n.RakahComponent.self

    // MARK: - Initializers
    init(_ component: Rakah.Component, longSitting: Bool = false) { // swiftlint:disable:this cyclomatic_complexity function_body_length
        switch component {
        case .takbir(let pos):
            name = l10n.Takbir.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Takbir")
            needsMovement = true
            position = pos
            isChangingText = false
            chapterNumber = nil

            if longSitting {
                movementSound = "E-Long"
            } else {
                switch pos {
                case .bending, .worship:
                    movementSound = "C-Short"

                case .standing, .sitting:
                    movementSound = "E-Short"

                default:
                    movementSound = nil
                }
            }

        case .openingSupplication:
            name = l10n.OpeningSupplication.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Opening-Supplication")
            needsMovement = false
            position = .standing
            movementSound = nil
            isChangingText = false
            chapterNumber = nil

        case .taawwudh:
            name = l10n.Taawwudh.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Taawwudh")
            needsMovement = false
            position = .standing
            movementSound = nil
            isChangingText = false
            chapterNumber = nil

        case .recitation(fileName: let fileName):
            let l10n = L10n.Recitation.self

            switch fileName {
            case "001_The-Opening":
                chapterNumber = 1
                name = l10n.TheOpening.name

            case "103_The-Flight-of-Time":
                chapterNumber = 103
                name = l10n.TheFlightOfTime.name

            case "104_The-Slanderer":
                chapterNumber = 104
                name = l10n.TheSlanderer.name

            case "105_The-Elephant":
                chapterNumber = 105
                name = l10n.TheElephant.name

            case "106_Quraysh":
                chapterNumber = 106
                name = l10n.Quraysh.name

            case "107_Assistance":
                chapterNumber = 107
                name = l10n.Assistance.name

            case "108_Good-in-Abundance":
                chapterNumber = 108
                name = l10n.GoodInAbundance.name

            case "109_Those-Who-Deny-the-Truth":
                chapterNumber = 109
                name = l10n.ThoseWhoDenyTheTruth.name

            case "110_Succour":
                chapterNumber = 110
                name = l10n.Succour.name

            case "111_The-Twisted-Strands":
                chapterNumber = 111
                name = l10n.TheTwistedStrands.name

            case "112_The-Declaration-of-Gods-Perfection":
                chapterNumber = 112
                name = l10n.TheDecleratiionOfGodsPerfection.name

            case "113_The-Rising-Dawn":
                chapterNumber = 113
                name = l10n.TheRisingDawn.name

            case "114_Men":
                chapterNumber = 114
                name = l10n.Men.name

            default:
                preconditionFailure()
            }

            spokenTextLines = RakahComponent.readLinesFromFile(named: fileName)
            needsMovement = false
            position = .standing
            movementSound = nil
            isChangingText = fileName != "001_The-Opening"

        case .ruku:
            name = l10n.Ruku.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Ruku")
            needsMovement = false
            position = .bending
            movementSound = nil
            isChangingText = false
            chapterNumber = nil

        case .straighteningUp:
            name = l10n.StraighteningUp.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Straightening-Up")
            needsMovement = true
            position = .standing
            movementSound = "E-Short"
            isChangingText = false
            chapterNumber = nil

        case .sajdah:
            name = l10n.Sajdah.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Sajdah")
            needsMovement = false
            position = .worship
            movementSound = nil
            isChangingText = false
            chapterNumber = nil

        case .tashahhud:
            name = l10n.Tashahhud.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Tashahhud")
            needsMovement = false
            position = .sitting
            movementSound = nil
            isChangingText = false
            chapterNumber = nil

        case .salatulIbrahimiyyah:
            name = l10n.SalatulIbrahimiyyah.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Salatul-Ibrahimiyyah")
            needsMovement = false
            position = .sitting
            movementSound = nil
            isChangingText = false
            chapterNumber = nil

        case .rabbanagh:
            name = l10n.Rabbanagh.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Rabbanagh")
            needsMovement = false
            position = .sitting
            movementSound = nil
            isChangingText = false
            chapterNumber = nil

        case .salam(let pos):
            name = l10n.Salam.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Salam")
            needsMovement = true
            movementSound = "G-Short"
            isChangingText = false
            position = pos
            chapterNumber = nil
        }
    }

    // MARK: - Type Methods
    private static func readLinesFromFile(named name: String) -> [String] {
        let spokenTextFilePath = Bundle.main.url(forResource: name, withExtension: "txt")!
        let contentString = try! String(contentsOf: spokenTextFilePath, encoding: .utf8) // swiftlint:disable:this force_try

        return contentString.stripped().components(separatedBy: .newlines)
    }
}

// MARK: - Sub Types
extension String {
    var estimatedReadingTime: Timespan {
        return RakahComponent.durationPerCharacter * Double(utf8.count)
    }
}
