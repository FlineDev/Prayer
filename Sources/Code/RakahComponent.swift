//
//  RakahComponent.swift
//  Prayer
//
//  Created by Cihat Gündüz on 10.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import Foundation
import HandySwift

typealias Duration = DispatchTimeInterval

/// A single unit a rakah can consists of.
class RakahComponent {
    // MARK: - Stored Type Properties

    static let lineChangeDuration = Duration.milliseconds(250)
    static let durationPerCharacter = Duration.milliseconds(50)


    // MARK: - Stored Instance Properties

    let name: String
    let spokenTextLines: [String]

    let l10n = L10n.RakahComponent.self


    // MARK: - Initializers

    init(_ component: Rakah.Component) {
        switch component {
        case .takbir:
            name = l10n.Takbir.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Takbir")
        case .openingSupplication:
            name = l10n.OpeningSupplication.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Opening-Supplication")
        case .taawwudh:
            name = l10n.Taawwudh.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Taawwudh")
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
        case .ruku:
            name = l10n.Ruku.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Ruku")
        case .straighteningUp:
            name = l10n.StraighteningUp.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Straightening-Up")
        case .sajdah:
            name = l10n.Sajdah.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Sajdah")
        case .tashahhud:
            name = l10n.Tashahhud.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Tashahhud")
        case .salatulIbrahimiyyah:
            name = l10n.SalatulIbrahimiyyah.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Salatul-Ibrahimiyyah")
        case .rabbanagh:
            name = l10n.Rabbanagh.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Rabbanagh")
        case .salam:
            name = l10n.Salam.name
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Salam")
        }
    }

    // MARK: - Type Methods

    private static func readLinesFromFile(named name: String) -> [String] {
        let spokenTextFilePath = Bundle.main.url(forResource: name, withExtension: "txt")!
        let contentString = try! String(contentsOf: spokenTextFilePath, encoding: .utf8)
        return contentString.strip.components(separatedBy: .newlines)
    }
}
