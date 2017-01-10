//
//  RakahComponent.swift
//  Prayer
//
//  Created by Cihat Gündüz (Privat) on 10.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import Foundation

typealias Duration = DispatchTimeInterval

/// A single unit a rakah can consists of.
class RakahComponent {
    // MARK: - Stored Instance Properties

    let name: String
    let spokenTextLines: [String]
    let estimatedDuration: Duration


    // MARK: - Initializers

    init(_ component: Rakah.Component) {
        switch component {
        case .takbir:
            name = NSLocalizedString("RAKAH_COMPONENT.TAKBIR.NAME", comment: "")
            spokenTextLines = try! String(contentsOfFile: "01_Takbir.txt", encoding: .utf8).components(separatedBy: .newlines)
            estimatedDuration = .seconds(3)
        }
    }
}
