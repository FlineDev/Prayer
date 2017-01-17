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

    let isBeginningOfPrayer: Bool
    let includesStandingRecitation: Bool
    let includesSittingRecitation: Bool
    let isEndOfPrayer: Bool


    // MARK: - Initializers

    init(isBeginningOfPrayer: Bool, includesStandingRecitation: Bool, includesSittingRecitation: Bool, isEndOfPrayer: Bool) {
        self.isBeginningOfPrayer = isBeginningOfPrayer
        self.includesStandingRecitation = includesStandingRecitation
        self.includesSittingRecitation = includesSittingRecitation
        self.isEndOfPrayer = isEndOfPrayer
    }


    // MARK: - Instance Methods

    func components() -> [RakahComponent] {
        var components: [RakahComponent] = []

        if isBeginningOfPrayer {
            components.append(RakahComponent(.takbir))
            components.append(RakahComponent(.openingSupplication))
            components.append(RakahComponent(.taawwudh))
        }

        components.append(RakahComponent(.recitation(fileName: "001_The-Opening")))

        if includesStandingRecitation {
            let randomFileName =  Component.nonOpeningRecitationFileNames.sample()!
            let standingRecitation = RakahComponent(.recitation(fileName: randomFileName))
            components.append(standingRecitation)
        }

        components.append(RakahComponent(.takbir))
        components.append(RakahComponent(.ruku))
        components.append(RakahComponent(.straighteningUp))

        2.times {
            components.append(RakahComponent(.takbir))
            components.append(RakahComponent(.sajdah))
            components.append(RakahComponent(.takbir))
        }

        if includesSittingRecitation {
            components.append(RakahComponent(.tashahhud))
        }

        if isEndOfPrayer {
            components.append(RakahComponent(.salatulIbrahimiyyah))
            components.append(RakahComponent(.rabbanagh))
            2.times { components.append(RakahComponent(.salam)) }
        }

        return components
    }
}

// MARK: - Sub Types

extension Rakah {
    enum Component {
        case takbir
        case openingSupplication
        case taawwudh
        case recitation(fileName: String)
        case ruku
        case straighteningUp // from Ruku
        case sajdah
        case tashahhud
        case salatulIbrahimiyyah
        case rabbanagh
        case salam

        static let theOpeningRecitationFileName = "001_The-Opening"

        static let nonOpeningRecitationFileNames = [
            "103_The-Flight-of-Time", "104_The-Slanderer", "105_The-Elephant", "106_Quraysh", "107_Assistance",
            "108_Good-in-Abundance", "109_Those-Who-Deny-the-Truth", "110_Succour", "111_The-Twisted-Strands",
            "112_The-Declaration-of-Gods-Perfection", "113_The-Rising-Dawn", "114_Men"
        ]

        static var all: [Component] {
            let nonQuranicComponents: [Component] = [
                .takbir, .openingSupplication, .taawwudh, .ruku, .straighteningUp, .sajdah, .tashahhud,
                .salatulIbrahimiyyah, .rabbanagh, .salam
            ]
            let recitations = ([theOpeningRecitationFileName] + nonOpeningRecitationFileNames).map { Component.recitation(fileName: $0) }
            return nonQuranicComponents + recitations
        }
    }
}
