//
//  Created by Cihat Gündüz on 25.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import SwiftyUserDefaults
import UIKit

struct PrayerViewModel {
  let currentComponentName: String

  let previousArrow: Position.Arrow?
  let previousLine: String?

  let currentArrow: Position.Arrow?
  let currentLine: String
  let currentIsComponentBeginning: Bool

  let nextArrow: Position.Arrow?
  let nextLine: String?
  let nextIsComponentBeginning: Bool
}
