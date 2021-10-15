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
  let standingRecitation: Recitation?

  // MARK: - Initializer
  init(
    isBeginningOfPrayer: Bool,
    includesStandingRecitation: Bool,
    includesSittingRecitation: Bool,
    isEndOfPrayer: Bool,
    allowLongerRecitations: Bool,
    excludeStandingRecitations: [Recitation] = []
  ) {
    self.isBeginningOfPrayer = isBeginningOfPrayer
    self.includesStandingRecitation = includesStandingRecitation
    self.includesSittingRecitation = includesSittingRecitation
    self.isEndOfPrayer = isEndOfPrayer

    if includesStandingRecitation {
      let allowedStandingRecitations = Recitation.allCases.dropFirst()
        .filter { recitation in
          if allowLongerRecitations {
            return recitation.length == .short || recitation.length == .medium
          }
          else {
            return recitation.length == .short
          }
        }
        .filter { !excludeStandingRecitations.contains($0) }
      self.standingRecitation = allowedStandingRecitations.randomElement()
    }
    else {
      self.standingRecitation = nil
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

    components.append(RakahComponent(.recitation(Recitation.theOpening)))

    if includesStandingRecitation {
      let standingRecitationComponent = RakahComponent(.recitation(standingRecitation!))
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

    if includesSittingRecitation {
      components.append(RakahComponent(.takbir(.sitting), longSitting: true))
      components.append(RakahComponent(.tashahhud))
    }
    else {
      components.append(RakahComponent(.takbir(.standing)))
    }

    if isEndOfPrayer {
      components.append(RakahComponent(.salatulIbrahimiyyah))
      components.append(RakahComponent(.rabbanagh))
      components.append(RakahComponent(.salam(.salamRight)))
      components.append(RakahComponent(.salam(.salamLeft)))
    }
    else if includesSittingRecitation {
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
    case recitation(Recitation)
    case ruku
    case straighteningUp  // from Ruku
    case sajdah
    case tashahhud
    case salatulIbrahimiyyah
    case rabbanagh
    case salam(Position)

    static var all: [Component] {
      let nonQuranicComponents: [Component] = [
        .takbir(.standing), .takbir(.bending), .takbir(.sitting), .takbir(.worship),
        .openingSupplication, .taawwudh, .ruku, .straighteningUp, .sajdah, .tashahhud,
        .salatulIbrahimiyyah, .rabbanagh, .salam(.salamRight), .salam(.salamLeft),
      ]
      let recitationComponents = Recitation.allCases.map { Component.recitation($0) }
      return nonQuranicComponents + recitationComponents
    }
  }
}
