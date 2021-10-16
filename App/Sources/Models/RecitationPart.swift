//
//  Created by Cihat Gündüz on 16.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

struct RecitationPart: Codable, DefaultsSerializable {
  let recitation: Recitation
  let partLength: Recitation.MaxArabicWordsPerStanding
  let part: Int
  let totalParts: Int

  init(
    recitation: Recitation,
    partLength: Recitation.MaxArabicWordsPerStanding,
    part: Int = 1,
    totalParts: Int = 1
  ) {
    self.recitation = recitation
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

extension Recitation: Codable {}
extension Recitation.MaxArabicWordsPerStanding: Codable {}
