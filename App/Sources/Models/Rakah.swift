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
   private let isBeginningOfPrayer: Bool
   private let includesSittingRecitation: Bool
   private let isEndOfPrayer: Bool
   let standingRecitationPart: RecitationPart?
   private let showStandingRecitationName: Bool

   private var includesStandingRecitation: Bool { self.standingRecitationPart != nil }

   init(
      isBeginningOfPrayer: Bool,
      standingRecitationPart: RecitationPart?,
      showStandingRecitationName: Bool,
      includesSittingRecitation: Bool,
      isEndOfPrayer: Bool
   ) {
      self.isBeginningOfPrayer = isBeginningOfPrayer
      self.includesSittingRecitation = includesSittingRecitation
      self.isEndOfPrayer = isEndOfPrayer
      self.standingRecitationPart = standingRecitationPart
      self.showStandingRecitationName = showStandingRecitationName
   }

   func components() -> [RakahComponent] {
      var components: [RakahComponent] = []

      if self.isBeginningOfPrayer {
         components.append(RakahComponent(.takbir(.standing)))
         components.append(RakahComponent(.openingSupplication))
         components.append(RakahComponent(.taawwudh))
      }

      components.append(RakahComponent(.recitationPart(.init(recitation: .theOpening, partLength: .short), showName: false)))

      if let standingRecitationPart = standingRecitationPart {
         let standingRecitationComponent = RakahComponent(.recitationPart(standingRecitationPart, showName: showStandingRecitationName))
         components.append(standingRecitationComponent)
      }

      components.append(RakahComponent(.takbir(.bending)))
      components.append(RakahComponent(.ruku))
      components.append(RakahComponent(.straighteningUp))

      components.append(RakahComponent(.takbir(.worship)))
      components.append(RakahComponent(.sajdah))
      components.append(RakahComponent(.takbir(.sitting)))

      components.append(RakahComponent(.takbir(.worship)))
      components.append(RakahComponent(.sajdah))

      if self.includesSittingRecitation {
         components.append(RakahComponent(.takbir(.sitting), longSitting: true))
         components.append(RakahComponent(.tashahhud))
      } else {
         components.append(RakahComponent(.takbir(.standing)))
      }

      if self.isEndOfPrayer {
         components.append(RakahComponent(.salatulIbrahimiyyah))
         components.append(RakahComponent(.rabbanagh))
         components.append(RakahComponent(.salam(.salamRight)))
         components.append(RakahComponent(.salam(.salamLeft)))
      } else if self.includesSittingRecitation {
         components.append(RakahComponent(.takbir(.standing)))
      }

      return components
   }
}

extension Rakah {
   enum Component {
      case takbir(Position)
      case openingSupplication
      case taawwudh
      case recitationPart(RecitationPart, showName: Bool)
      case ruku
      case straighteningUp  // from Ruku
      case sajdah
      case tashahhud
      case salatulIbrahimiyyah
      case rabbanagh
      case salam(Position)
   }
}
