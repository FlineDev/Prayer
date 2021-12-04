//
//  Created by Cihat Gündüz on 12.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

/// Represents a recitation with its surah (chapter) number as its raw value.
enum Recitation: Int, CaseIterable, Equatable, DefaultsSerializable {
  enum MaxArabicWordsPerStanding: Int, Equatable, Codable {
    case short = 50
    case longer = 200

    var factor: Int {
      self.rawValue / Self.short.rawValue
    }
  }

  case theOpening = 1

  case theMostGracious = 55
  case thatWhichMustComeToPass = 56
  case iron = 57
  case thePleading = 58
  case theGathering = 59
  case theExaminedOne = 60
  case theRanks = 61
  case theCongregation = 62
  case theHypocrites = 63
  case lossAndGain = 64
  case divorce = 65
  case prohibition = 66
  case dominion = 67
  case thePen = 68
  case theLayingBareOfTheTruth = 69
  case theWaysOfAscent = 70
  case noah = 71
  case theUnseenBeings = 72
  case theEnwrappedOne = 73
  case theEnfoldedOne = 74
  case resurrection = 75
  case man = 76
  case thoseSentForth = 77
  case theTiding = 78
  case thoseThatRise = 79
  case heFrowned = 80
  case shroudingInDarkness = 81
  case theCleavingAsunder = 82
  case thoseWhoGiveShortMeasure = 83
  case theSplittingAsunder = 84
  case theGreatConstellations = 85
  case thatWhichComesInTheNight = 86
  case theAllHighest = 87
  case theOvershadowingEvent = 88
  case theDaybreak = 89
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

  /// The separator to use when splitting Surah into multiple parts. This helps prevent bad separation points. All translations should have one every 50 words.
  static let splitSeparator: String = "⁋"

  var fileName: String {
    return String(format: "%03d", rawValue)
  }

  var localizedTitle: String {
    let l10n = L10n.Recitation.self

    switch self {
    case .theOpening:
      return l10n.TheOpening.name

    case .theMostGracious:
      return l10n.TheMostGracious.name

    case .thatWhichMustComeToPass:
      return l10n.ThatWhichMustComeToPass.name

    case .iron:
      return l10n.Iron.name

    case .thePleading:
      return l10n.ThePleading.name

    case .theGathering:
      return l10n.TheGathering.name

    case .theExaminedOne:
      return l10n.TheExaminedOne.name

    case .theRanks:
      return l10n.TheRanks.name

    case .theCongregation:
      return l10n.TheCongregation.name

    case .theHypocrites:
      return l10n.TheHypocrites.name

    case .lossAndGain:
      return l10n.LossAndGain.name

    case .divorce:
      return l10n.Divorce.name

    case .prohibition:
      return l10n.Prohibition.name

    case .dominion:
      return l10n.Dominion.name

    case .thePen:
      return l10n.ThePen.name

    case .theLayingBareOfTheTruth:
      return l10n.TheLayingBareOfTheTruth.name

    case .theWaysOfAscent:
      return l10n.TheWaysOfAscent.name

    case .noah:
      return l10n.Noah.name

    case .theUnseenBeings:
      return l10n.TheUnseenBeings.name

    case .theEnwrappedOne:
      return l10n.TheEnwrappedOne.name

    case .theEnfoldedOne:
      return l10n.TheEnfoldedOne.name

    case .resurrection:
      return l10n.Resurrection.name

    case .man:
      return l10n.Man.name

    case .thoseSentForth:
      return l10n.ThoseSentForth.name

    case .theTiding:
      return l10n.TheTiding.name

    case .thoseThatRise:
      return l10n.ThoseThatRise.name

    case .heFrowned:
      return l10n.HeFrowned.name

    case .shroudingInDarkness:
      return l10n.ShroudingInDarkness.name

    case .theCleavingAsunder:
      return l10n.TheCleavingAsunder.name

    case .thoseWhoGiveShortMeasure:
      return l10n.ThoseWhoGiveShortMeasure.name

    case .theSplittingAsunder:
      return l10n.TheSplittingAsunder.name

    case .theGreatConstellations:
      return l10n.TheGreatConstellations.name

    case .thatWhichComesInTheNight:
      return l10n.ThatWhichComesInTheNight.name

    case .theAllHighest:
      return l10n.TheAllHighest.name

    case .theOvershadowingEvent:
      return l10n.TheOvershadowingEvent.name

    case .theDaybreak:
      return l10n.TheDaybreak.name

    case .theLand:
      return l10n.TheLand.name

    case .theSun:
      return l10n.TheSun.name

    case .theNight:
      return l10n.TheNight.name

    case .theBrightMorningHours:
      return l10n.TheBrightMorningHours.name

    case .theOpeningUpOfTheHeart:
      return l10n.TheOpeningUpOfTheHeart.name

    case .theFig:
      return l10n.TheFig.name

    case .theGermCell:
      return l10n.TheGermCell.name

    case .destiny:
      return l10n.Destiny.name

    case .theEvidenceOfTheTruth:
      return l10n.TheEvidenceOfTheTruth.name

    case .theEarthquake:
      return l10n.TheEarthquake.name

    case .theChargers:
      return l10n.TheChargers.name

    case .theSuddenCalamity:
      return l10n.TheSuddenCalamity.name

    case .greedForMoreAndMore:
      return l10n.GreedForMoreAndMore.name

    case .theFlightOfTime:
      return l10n.TheFlightOfTime.name

    case .theSlanderer:
      return l10n.TheSlanderer.name

    case .theElephant:
      return l10n.TheElephant.name

    case .quraysh:
      return l10n.Quraysh.name

    case .assistance:
      return l10n.Assistance.name

    case .goodInAbundance:
      return l10n.GoodInAbundance.name

    case .thoseWhoDenyTheTruth:
      return l10n.ThoseWhoDenyTheTruth.name

    case .succour:
      return l10n.Succour.name

    case .theTwistedStrands:
      return l10n.TheTwistedStrands.name

    case .theDeclarationOfGodsPerfection:
      return l10n.TheDecleratiionOfGodsPerfection.name

    case .theRisingDawn:
      return l10n.TheRisingDawn.name

    case .men:
      return l10n.Men.name
    }
  }

  /// The number of words the Surah consists of in the Arabic original.
  var arabicWordsCount: Int {
    Self.chapterNumToWordsCount[rawValue]!
  }

  func totalParts(maxWordsPerPart: MaxArabicWordsPerStanding) -> Int {
    Int((Double(arabicWordsCount) / Double(maxWordsPerPart.rawValue)).rounded(.up))
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
