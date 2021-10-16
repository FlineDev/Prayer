//
//  Created by Cihat Gündüz on 16.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

struct RecitationPart: Codable, DefaultsSerializable {
  let partLength: Recitation.MaxArabicWordsPerStanding
  let part: Int
  let totalParts: Int

  // NOTE: Workaround for an issue with SwiftyUserDefaults where RawRepresentable enums can't be Codable, too.
  private let recitationRawValue: Recitation.RawValue
  var recitation: Recitation {
    Recitation(rawValue: recitationRawValue)!
  }

  init(
    recitation: Recitation,
    partLength: Recitation.MaxArabicWordsPerStanding,
    part: Int = 1,
    totalParts: Int = 1
  ) {
    self.recitationRawValue = recitation.rawValue
    self.partLength = partLength
    self.part = part
    self.totalParts = totalParts
  }

  func nextPart() -> RecitationPart? {
    guard part < totalParts else { return nil }

    return RecitationPart(
      recitation: recitation,
      partLength: partLength,
      part: part + 1,
      totalParts: totalParts
    )
  }
}
