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


    // MARK: - Initializers

    init(_ component: Rakah.Component) {
        switch component {
        case .takbir:
            name = NSLocalizedString("RAKAH_COMPONENT.TAKBIR.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Takbir")
        case .openingSupplication:
            name = NSLocalizedString("RAKAH_COMPONENT.OPENING_SUPPLICATION.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Opening-Supplication")
        case .taawwudh:
            name = NSLocalizedString("RAKAH_COMPONENT.TAAWWUDH.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Taawwudh")
        case .recitation(fileName: let fileName):
            switch fileName {
            case "001_The-Opening":
                name = NSLocalizedString("RECITATION.THE_OPENING.NAME", comment: "")
            case "103_The-Flight-of-Time":
                name = NSLocalizedString("RECITATION.THE_FLIGHT_OF_TIME.NAME", comment: "")
            case "104_The-Slanderer":
                name = NSLocalizedString("RECITATION.THE_SLANDERER.NAME", comment: "")
            case "105_The-Elephant":
                name = NSLocalizedString("RECITATION.THE_ELEPHANT.NAME", comment: "")
            case "106_Quraysh":
                name = NSLocalizedString("RECITATION.QURAYSH.NAME", comment: "")
            case "107_Assistance":
                name = NSLocalizedString("RECITATION.ASSISTANCE.NAME", comment: "")
            case "108_Good-in-Abundance":
                name = NSLocalizedString("RECITATION.GOOD_IN_ABUNDANCE.NAME", comment: "")
            case "109_Those-Who-Deny-the-Truth":
                name = NSLocalizedString("RECITATION.THOSE_WHO_DENY_THE_TRUTH.NAME", comment: "")
            case "110_Succour":
                name = NSLocalizedString("RECITATION.SUCCOUR.NAME", comment: "")
            case "111_The-Twisted-Strands":
                name = NSLocalizedString("RECITATION.THE_TWISTED_STRANDS", comment: "")
            case "112_The-Declaration-of-Gods-Perfection":
                name = NSLocalizedString("RECITATION.THE_DECLERATIION_OF_GODS_PERFECTION.NAME", comment: "")
            case "113_The-Rising-Dawn":
                name = NSLocalizedString("RECITATION.THE_RISING_DAWN.NAME", comment: "")
            case "114_Men":
                name = NSLocalizedString("RECITATION.MEN.NAME", comment: "")
            default: preconditionFailure()
            }
            spokenTextLines = RakahComponent.readLinesFromFile(named: fileName)
        case .ruku:
            name = NSLocalizedString("RAKAH_COMPONENT.RUKU.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Ruku")
        case .straighteningUp:
            name = NSLocalizedString("RAKAH_COMPONENT.STRAIGHTENING_UP.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Straightening-Up")
        case .sajdah:
            name = NSLocalizedString("RAKAH_COMPONENT.SAJDAH.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Sajdah")
        case .tashahhud:
            name = NSLocalizedString("RAKAH_COMPONENT.TASHAHHUD.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Tashahhud")
        case .salatulIbrahimiyyah:
            name = NSLocalizedString("RAKAH_COMPONENT.SALATUL_IBRAHIMIYYAH.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Salatul-Ibrahimiyyah")
        case .rabbanagh:
            name = NSLocalizedString("RAKAH_COMPONENT.RABBANAGH.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: "Rabbanagh")
        case .salam:
            name = NSLocalizedString("RAKAH_COMPONENT.SALAM.NAME", comment: "")
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
