//
//  Rakah.swift
//  Prayer
//
//  Created by Cihat Gündüz (Privat) on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import Foundation

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
            
        }

        // TODO: not yet implemented
        return []
    }
}

// MARK: - Sub Types

extension Rakah {
    enum Component {
        case takbir
    }
}
