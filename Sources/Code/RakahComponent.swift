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
            spokenTextLines = RakahComponent.readLinesFromFile(named: "01_Takbir")
        case .openingSupplication:
            name = NSLocalizedString("RAKAH_COMPONENT.OPENING_SUPPLICATION.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: "02_Opening-Supplication")
        case .taawwudh:
            name = NSLocalizedString("RAKAH_COMPONENT.TAAWWUDH.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: "03_Taawwudh")
        case .recitationTheOpening:
            name = NSLocalizedString("RAKAH_COMPONENT.RECITATION.THE_OPENING.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: "001_The-Opening")
        case .recitation(fileName: let fileName):
            name = NSLocalizedString("RAKAH_COMPONENT.RECITATION.RANDOM.NAME", comment: "")
            spokenTextLines = RakahComponent.readLinesFromFile(named: fileName)
        }
    }

    // MARK: - Type Methods

    private static func readLinesFromFile(named name: String) -> [String] {
        let spokenTextFilePath = Bundle.main.url(forResource: name, withExtension: "txt")!
        let contentString = try! String(contentsOf: spokenTextFilePath, encoding: .utf8)
        return contentString.strip.components(separatedBy: .newlines)
    }
}
