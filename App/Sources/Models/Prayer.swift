//
//  Created by Cihat Gündüz on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

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
  ///   - allowLongerRecitations: If `true`, longer (bot not very long) recitations should be allowed.
  ///   - allowSplittingRecitations: If `true`, the splitting of (longer and) very long recitations should be allowed.
  /// - Returns: The Prayer object.
  init(
    rakatCount: UInt,
    allowLongerRecitations: Bool,
    allowSplittingRecitations: Bool
  ) {
    self.rakat = {
      var rakat: Rakat = []
      var usedStandingRecitations: [Recitation] = []
      let partLength: Recitation.MaxArabicWordsPerStanding = allowLongerRecitations ? .longer : .short

      for num in 1...rakatCount {
        var standingRecitationPart: RecitationPart?

        if num <= 2 {
          if allowSplittingRecitations {
            if let nextRecitationPart = Defaults.nextRecitationPart {
              standingRecitationPart = nextRecitationPart
              Defaults.nextRecitationPart = nextRecitationPart.nextPart()
            }
            else {
              let allowedStandingRecitations = Recitation.allCases.dropFirst()
                .filter { !usedStandingRecitations.contains($0) }
              let recitation = allowedStandingRecitations.randomElement()!
              let totalParts = recitation.totalParts(maxWordsPerPart: partLength)

              standingRecitationPart = .init(recitation: recitation, partLength: partLength, totalParts: totalParts)
              Defaults.nextRecitationPart = standingRecitationPart!.nextPart()
            }
          }
          else {
            let allowedStandingRecitations = Recitation.allCases.dropFirst()
              .filter { $0.totalParts(maxWordsPerPart: allowLongerRecitations ? .longer : .short) == 1 }
              .filter { !usedStandingRecitations.contains($0) }
            let recitation = allowedStandingRecitations.randomElement()!
            standingRecitationPart = .init(recitation: recitation, partLength: partLength)
          }
        }
        else {
          standingRecitationPart = nil
        }

        let rakah = Rakah(
          isBeginningOfPrayer: num == 1,
          standingRecitationPart: standingRecitationPart,
          includesSittingRecitation: num % 2 == 0 || num == rakatCount,
          isEndOfPrayer: num == rakatCount
        )
        rakat.append(rakah)

        if let standingRecitationPart = standingRecitationPart {
          usedStandingRecitations.append(standingRecitationPart.recitation)
        }
      }

      return rakat
    }()
  }
}

extension DefaultsKeys {
  var nextRecitationPart: DefaultsKey<RecitationPart?> { .init("NextRecitationPart") }
}
