//
//  Created by Cihat Gündüz on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import Foundation

/// The "physical, mental, and spiritual act of worship that is observed five times every day at prescribed times."
/// - Wikipedia (https://en.wikipedia.org/wiki/Salah)
class Prayer {
  // MARK: - Stored Instance Properties
  let rakat: Rakat

  // MARK: - Initializer
  /// Creates a new prayer automatically based on the number of rakat.
  /// Currently the logic covers creating the five daily prayers.
  ///
  /// - Parameters:
  ///   - rakatCount: The number of rakats to be included in the prayer.
  /// - Returns: The Prayer object.
  init(
    rakatCount: UInt,
    allowLongerRecitations: Bool
  ) {
    self.rakat = {
      var rakat: Rakat = []
      var usedStandingRecitations: [Recitation] = []
      for num in 1...rakatCount {
        var standingRecitation: Recitation?

        if num <= 2 {
          let allowedStandingRecitations = Recitation.allCases.dropFirst()
            .filter { recitation in
              if allowLongerRecitations {
                return recitation.arabicWordsCount <= Recitation.MaxArabicWordsPerStanding.longer.rawValue
              }
              else {
                return recitation.arabicWordsCount <= Recitation.MaxArabicWordsPerStanding.short.rawValue
              }
            }
            .filter { !usedStandingRecitations.contains($0) }
          standingRecitation = allowedStandingRecitations.randomElement()
        }
        else {
          standingRecitation = nil
        }

        // TODO: [cg_2021-10-15] add logic to split surah to multiple rakat to fit into the prayer

        let rakah = Rakah(
          isBeginningOfPrayer: num == 1,
          standingRecitation: standingRecitation,
          includesSittingRecitation: num % 2 == 0 || num == rakatCount,
          isEndOfPrayer: num == rakatCount
        )
        rakat.append(rakah)

        if let standingRecitation = standingRecitation {
          usedStandingRecitations.append(standingRecitation)
        }
      }

      return rakat
    }()
  }
}
