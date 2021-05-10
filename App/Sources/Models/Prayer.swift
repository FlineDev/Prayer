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
    rakatCount: UInt
  ) {
    self.rakat = {
      var rakat: Rakat = []
      var usedStandingRecitationFileNames: [String] = []
      for num in 1...rakatCount {
        let rakah = Rakah(
          isBeginningOfPrayer: num == 1,
          includesStandingRecitation: num <= 2,
          includesSittingRecitation: num % 2 == 0 || num == rakatCount,
          isEndOfPrayer: num == rakatCount,
          excludeStandingRecitationNames: usedStandingRecitationFileNames
        )
        rakat.append(rakah)
        if let standingRecitationFileName = rakah.standingRecitationFileName {
          usedStandingRecitationFileNames.append(standingRecitationFileName)
        }
      }

      return rakat
    }()
  }
}
