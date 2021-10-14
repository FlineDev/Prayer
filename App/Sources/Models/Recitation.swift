//
//  Created by Cihat Gündüz on 12.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import Foundation

/// Represents a recitation with its surah (chapter) number as its raw value.
enum Recitation: Int, CaseIterable {
  /// The length group of a recitation.
  enum Length {
    /// Short enough to consider for every prayers Rakah, even when time is limited.
    case short

    /// Short enough to consider for prayers in one Rakah, where time is not limited.
    case medium

    /// Too long to recite in one Rakah. Can be split to up to 4 smaller parts, that can be fully recited in a prayer with 4 Rakat.
    case long

    /// Too long to recite in one Prayer. Must be split into more than 4 smaller parts, requires persistance of last prayer to continue from last point left off.
    case veryLong
  }

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

  /// The length of the Surah. See docs of ``Length`` cases for their exact meaning.
  var length: Length {
    switch arabicWordsCount {
    case 0..<50:  // 21 Surah fall under this range
      return .short

    case 50..<200:  // 21 Surah fall under this range, too
      return .medium

    case 200..<800:  // 36 Surah fall under this range
      return .long

    case 800...:  // 34 Surah fall under this range
      return .veryLong

    default:
      fatalError("Unexpectedly found negative arabic words count of \(arabicWordsCount) for Surah \(rawValue).")
    }
  }

  /// The number of words the Surah consists of in the Arabic original.
  private var arabicWordsCount: Int {
    Self.chapterNumToWordsCount[rawValue]!
  }

  // Source: https://qurananalysis.com/analysis/basic-statistics.php?lang=AR
  private static let chapterNumToWordsCount: [Int: Int] = [
    1: 29, 2: 6140, 3: 3501, 4: 3763, 5: 2837, 6: 3056, 7: 3341, 8: 1242, 9: 2505, 10: 1839, 11: 1946, 12: 1795,
    13: 853, 14: 830, 15: 657, 16: 1844, 17: 1558, 18: 1583, 19: 971, 20: 1353, 21: 1174, 22: 1279, 23: 1052,
    24: 1319, 25: 896, 26: 1320, 27: 1159, 28: 1438, 29: 978, 30: 817, 31: 550, 32: 372, 33: 1303, 34: 884, 35: 778,
    36: 730, 37: 865, 38: 735, 39: 1177, 40: 1226, 41: 794, 42: 860, 43: 836, 44: 346, 45: 488, 46: 645, 47: 542,
    48: 560, 49: 353, 50: 373, 51: 360, 52: 312, 53: 360, 54: 342, 55: 352, 56: 379, 57: 575, 58: 475, 59: 447,
    60: 352, 61: 226, 62: 177, 63: 181, 64: 242, 65: 289, 66: 254, 67: 333, 68: 301, 69: 260, 70: 217, 71: 227,
    72: 286, 73: 200, 74: 256, 75: 164, 76: 243, 77: 181, 78: 174, 79: 179, 80: 133, 81: 104, 82: 81, 83: 169,
    84: 108, 85: 109, 86: 61, 87: 72, 88: 92, 89: 139, 90: 82, 91: 54, 92: 71, 93: 40, 94: 27, 95: 34, 96: 72,
    97: 30, 98: 94, 99: 36, 100: 40, 101: 36, 102: 28, 103: 14, 104: 33, 105: 23, 106: 17, 107: 25, 108: 10, 109: 27,
    110: 19, 111: 23, 112: 15, 113: 23, 114: 20,
  ]
}