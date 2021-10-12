//
//  Created by Cihat Gündüz on 12.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import Foundation

/// Represents a recitation with its surah (chapter) number as its raw value..
enum Recitation: Int, CaseIterable {
  case theOpening = 1

  case theLand = 90
  case theSun = 91
  case theNight = 92
  case theBrightMorningHours = 93
  case theOpeningUpOfTheHeart = 94
  case theFig = 95
  case theGermCell = 96
  case destiny = 97
  case theEvidenceOfTheTruth = 98
  case theEarthquake = 99
  case theChargers = 100
  case theSuddenCalamity = 101
  case greedForMoreAndMore = 102
  case theFlightOfTime = 103
  case theSlanderer = 104
  case theElephant = 105
  case quraysh = 106
  case assistance = 107
  case goodInAbundance = 108
  case thoseWhoDenyTheTruth = 109
  case succour = 110
  case theTwistedStrands = 111
  case theDeclarationOfGodsPerfection = 112
  case theRisingDawn = 113
  case men = 114

  var fileName: String {
    let normalizedNum = String(format: "%03d", rawValue)
    let normalizedTitle = title.components(separatedBy: .whitespaces).joined(separator: "-")
    return "\(normalizedNum)_\(normalizedTitle)"
  }

  private var title: String {
    switch self {
    case .theOpening:  // 001
      return "The Opening"

    case .theLand:  // 90
      return "The Land"

    case .theSun:  // 91
      return "The Sun"

    case .theNight:  // 92
      return "The Night"

    case .theBrightMorningHours:  // 93
      return "The Bright Morning Hours"

    case .theOpeningUpOfTheHeart:  // 94
      return "The Opening Up of the Heart"

    case .theFig:  // 95
      return "The Fig"

    case .theGermCell:  // 96
      return "The Germ Cell"

    case .destiny:  // 97
      return "Destiny"

    case .theEvidenceOfTheTruth:  // 98
      return "The Evidence of the Truth"

    case .theEarthquake:  // 99
      return "The Earthquake"

    case .theChargers:  // 100
      return "The Chargers"

    case .theSuddenCalamity:  // 101
      return "The Sudden Calamity"

    case .greedForMoreAndMore:  // 102
      return "Greed for More and More"

    case .theFlightOfTime:  // 103
      return "The Flight of Time"

    case .theSlanderer:  // 104
      return "The Slanderer"

    case .theElephant:  // 105
      return "The Elephant"

    case .quraysh:  // 106
      return "Quraysh"

    case .assistance:  // 107
      return "Assistance"

    case .goodInAbundance:  // 108
      return "Good in Abundance"

    case .thoseWhoDenyTheTruth:  // 109
      return "Those Who Deny the Truth"

    case .succour:  // 110
      return "Succour"

    case .theTwistedStrands:  // 111
      return "The Twisted Strands"

    case .theDeclarationOfGodsPerfection:  // 112
      return "The Declaration of Gods Perfection"

    case .theRisingDawn:  // 113
      return "The Rising Dawn"

    case .men:  // 114
      return "Men"
    }
  }
}
