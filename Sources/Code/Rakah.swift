//
//  Rakah.swift
//  Prayer
//
//  Created by Cihat Gündüz on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import Foundation
import HandySwift

/// "Arabic: ركعة‎‎ rakʿah, plural: ركعات rakaʿāt"
/// - Wikipedia (https://en.wikipedia.org/wiki/Rakat)
typealias Rakat = [Rakah]

/// "(A) single unit of Islamic prayers."
/// - Wikipedia (https://en.wikipedia.org/wiki/Rakat)
class Rakah {
    // MARK: - Stored Instance Properties

    private let isBeginningOfPrayer: Bool
    private let includesStandingRecitation: Bool
    private let includesSittingRecitation: Bool
    private let isEndOfPrayer: Bool
    let standingRecitationFileName: String?


    // MARK: - Initializers

    init(isBeginningOfPrayer: Bool, includesStandingRecitation: Bool, includesSittingRecitation: Bool, isEndOfPrayer: Bool, excludeStandingRecitationNames: [String] = []) {
        self.isBeginningOfPrayer = isBeginningOfPrayer
        self.includesStandingRecitation = includesStandingRecitation
        self.includesSittingRecitation = includesSittingRecitation
        self.isEndOfPrayer = isEndOfPrayer

        if includesStandingRecitation {
            let allowedStandingRecitationNames = Component.nonOpeningRecitationFileNames.filter { !excludeStandingRecitationNames.contains($0) }
            self.standingRecitationFileName = allowedStandingRecitationNames.sample()
        } else {
            self.standingRecitationFileName = nil
        }
    }


    // MARK: - Instance Methods

    func components() -> [RakahComponent] {
        var components: [RakahComponent] = []

        if isBeginningOfPrayer {
            components.append(RakahComponent(.takbir(.enclosing)))
            components.append(RakahComponent(.openingSupplication))
            components.append(RakahComponent(.taawwudh))
        }

        components.append(RakahComponent(.recitation(fileName: "001_The-Opening")))

        if includesStandingRecitation {
            let standingRecitation = RakahComponent(.recitation(fileName: standingRecitationFileName!))
            components.append(standingRecitation)
        }

        components.append(RakahComponent(.takbir(.down)))
        components.append(RakahComponent(.ruku))
        components.append(RakahComponent(.straighteningUp))

        components.append(RakahComponent(.takbir(.down)))
        components.append(RakahComponent(.sajdah))
        components.append(RakahComponent(.takbir(.up)))

        components.append(RakahComponent(.takbir(.down)))
        components.append(RakahComponent(.sajdah))

        if includesSittingRecitation {
            components.append(RakahComponent(.takbir(.upSpecial)))
            components.append(RakahComponent(.tashahhud))
        } else {
            components.append(RakahComponent(.takbir(.up)))
        }

        if isEndOfPrayer {
            components.append(RakahComponent(.salatulIbrahimiyyah))
            components.append(RakahComponent(.rabbanagh))
            components.append(RakahComponent(.salam(.right)))
            components.append(RakahComponent(.salam(.left)))
        } else if includesSittingRecitation {
            components.append(RakahComponent(.takbir(.up)))
        }

        return components
    }
}

// MARK: - Sub Types

extension Rakah {
    enum Component {
        case takbir(TakbirType)
        case openingSupplication
        case taawwudh
        case recitation(fileName: String)
        case ruku
        case straighteningUp // from Ruku
        case sajdah
        case tashahhud
        case salatulIbrahimiyyah
        case rabbanagh
        case salam(SalamType)

        static let theOpeningRecitationFileName = "001_The-Opening"

        static let nonOpeningRecitationFileNames = [
            "103_The-Flight-of-Time", "104_The-Slanderer", "105_The-Elephant", "106_Quraysh", "107_Assistance",
            "108_Good-in-Abundance", "109_Those-Who-Deny-the-Truth", "110_Succour", "111_The-Twisted-Strands",
            "112_The-Declaration-of-Gods-Perfection", "113_The-Rising-Dawn", "114_Men"
        ]

        static var all: [Component] {
            let nonQuranicComponents: [Component] = [
                .takbir(.enclosing), .takbir(.up), .takbir(.upSpecial), .takbir(.down), .takbir(.downSpecial),
                .openingSupplication, .taawwudh, .ruku, .straighteningUp, .sajdah, .tashahhud,
                .salatulIbrahimiyyah, .rabbanagh, .salam(.right), .salam(.left)
            ]
            let recitations = ([theOpeningRecitationFileName] + nonOpeningRecitationFileNames).map { Component.recitation(fileName: $0) }
            return nonQuranicComponents + recitations
        }

        enum TakbirType {
            case enclosing
            case up
            case upSpecial
            case down
            case downSpecial
        }

        enum SalamType {
            case right
            case left
        }
    }
}
