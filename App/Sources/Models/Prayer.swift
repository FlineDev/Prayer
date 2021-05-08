//
//  Created by Cihat Gündüz on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import Foundation
import RealmSwift

/// The "physical, mental, and spiritual act of worship that is observed five times every day at prescribed times."
/// - Wikipedia (https://en.wikipedia.org/wiki/Salah)
@objcMembers
class Prayer: BaseObject {
  // MARK: - Stored Instance Properties
  let rakat = List<Rakah>()

  // MARK: - Initializer Alternative
  /// Creates a new prayer automatically based on the number of rakat.
  /// Currently the logic covers creating the five daily prayers.
  ///
  /// - Parameters:
  ///   - rakatCount: The number of rakats to be included in the prayer.
  /// - Returns: The Prayer object.
  static func make(rakatCount: UInt) -> Prayer {
    let prayer = Prayer()

    var usedStandingRecitationFileNames: [String] = []
    for num in 1...rakatCount {
      let rakah = Rakah.make(
        isBeginningOfPrayer: num == 1,
        includesStandingRecitation: num <= 2,
        includesSittingRecitation: num % 2 == 0 || num == rakatCount,
        isEndOfPrayer: num == rakatCount,
        excludeStandingRecitationNames: usedStandingRecitationFileNames
      )

      prayer.rakat.append(rakah)

      if let standingRecitationFileName = rakah.standingRecitationFileName {
        usedStandingRecitationFileNames.append(standingRecitationFileName)
      }
    }

    return prayer
  }
}
