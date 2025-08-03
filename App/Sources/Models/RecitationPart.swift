//
//  Created by Cihat Gündüz on 16.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import Foundation
import HandySwift
import SwiftyUserDefaults

struct RecitationPart: Codable, DefaultsSerializable {
   let partLength: Recitation.MaxArabicWordsPerStanding
   let part: Int
   let totalParts: Int

   // NOTE: Workaround for an issue with SwiftyUserDefaults where RawRepresentable enums can't be Codable, too.
   private let recitationRawValue: Recitation.RawValue
   var recitation: Recitation {
      Recitation(rawValue: self.recitationRawValue)!
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
      guard self.part < self.totalParts else { return nil }

      return RecitationPart(
         recitation: self.recitation,
         partLength: self.partLength,
         part: self.part + 1,
         totalParts: self.totalParts
      )
   }

   func recitationLines() -> [String] {
      var contentString = self.recitation.contentString()

      if self.totalParts > 1 {
         let shortLengthTotalParts = self.recitation.totalParts(maxWordsPerPart: .short)

         let separatorLowerBoundIndex = (part - 1) * self.partLength.factor
         let separatorUpperBoundIndex = min(separatorLowerBoundIndex + self.partLength.factor, shortLengthTotalParts)
         let partIndexRange = separatorLowerBoundIndex..<separatorUpperBoundIndex
         contentString = contentString.components(separatedBy: Recitation.splitSeparator)[partIndexRange].joined()
      }

      return contentString.components(separatedBy: .newlines)
         .filter { !$0.contains(Recitation.splitSeparator) }
         .map { $0.stripped() }
         .filter { !$0.isBlank }
   }
}
