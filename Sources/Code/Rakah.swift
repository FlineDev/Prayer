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
    init(isBeginningOfPrayer: Bool, includesStandingRecitation: Bool, includesSittingRecitation: Bool,
         isEndOfPrayer: Bool, excludeStandingRecitationNames: [String] = []) {
        self.isBeginningOfPrayer = isBeginningOfPrayer
        self.includesStandingRecitation = includesStandingRecitation
        self.includesSittingRecitation = includesSittingRecitation
        self.isEndOfPrayer = isEndOfPrayer

        if includesStandingRecitation {
            let allowedStandingRecitationNames = Component.nonOpeningRecitationFileNames.filter { !excludeStandingRecitationNames.contains($0) }
            self.standingRecitationFileName = allowedStandingRecitationNames.sample
        } else {
            self.standingRecitationFileName = nil
        }
    }

    // MARK: - Instance Methods
    func components() -> [RakahComponent] {
        var components: [RakahComponent] = []

        if isBeginningOfPrayer {
            components.append(RakahComponent(.takbir(.standing)))
            components.append(RakahComponent(.openingSupplication))
            components.append(RakahComponent(.taawwudh))
        }

        components.append(RakahComponent(.recitation(fileName: "001_The-Opening")))

        if includesStandingRecitation {
            let standingRecitation = RakahComponent(.recitation(fileName: standingRecitationFileName!))
            components.append(standingRecitation)
        }

        components.append(RakahComponent(.takbir(.bending)))
        components.append(RakahComponent(.ruku))
        components.append(RakahComponent(.straighteningUp))

        components.append(RakahComponent(.takbir(.worship)))
        components.append(RakahComponent(.sajdah))
        components.append(RakahComponent(.takbir(.sitting)))

        components.append(RakahComponent(.takbir(.worship)))
        components.append(RakahComponent(.sajdah))

        if includesSittingRecitation {
            components.append(RakahComponent(.takbir(.sitting), longSitting: true))
            components.append(RakahComponent(.tashahhud))
        } else {
            components.append(RakahComponent(.takbir(.standing)))
        }

        if isEndOfPrayer {
            components.append(RakahComponent(.salatulIbrahimiyyah))
            components.append(RakahComponent(.rabbanagh))
            components.append(RakahComponent(.salam(.salamRight)))
            components.append(RakahComponent(.salam(.salamLeft)))
        } else if includesSittingRecitation {
            components.append(RakahComponent(.takbir(.standing)))
        }

        return components
    }
}

// MARK: - Sub Types
extension Rakah {
    enum Component {
        case takbir(Position)
        case openingSupplication
        case taawwudh
        case recitation(fileName: String)
        case ruku
        case straighteningUp // from Ruku
        case sajdah
        case tashahhud
        case salatulIbrahimiyyah
        case rabbanagh
        case salam(Position)

        static let theOpeningRecitationFileName = "001_The-Opening"

        static let nonOpeningRecitationFileNames = [
            "103_The-Flight-of-Time", "104_The-Slanderer", "105_The-Elephant", "106_Quraysh", "107_Assistance",
            "108_Good-in-Abundance", "109_Those-Who-Deny-the-Truth", "110_Succour", "111_The-Twisted-Strands",
            "112_The-Declaration-of-Gods-Perfection", "113_The-Rising-Dawn", "114_Men"
        ]

        static var all: [Component] {
            let nonQuranicComponents: [Component] = [
                .takbir(.standing), .takbir(.bending), .takbir(.sitting), .takbir(.worship),
                .openingSupplication, .taawwudh, .ruku, .straighteningUp, .sajdah, .tashahhud,
                .salatulIbrahimiyyah, .rabbanagh, .salam(.salamRight), .salam(.salamLeft)
            ]
            let recitations = ([theOpeningRecitationFileName] + nonOpeningRecitationFileNames).map { Component.recitation(fileName: $0) }
            return nonQuranicComponents + recitations
        }
    }
}
