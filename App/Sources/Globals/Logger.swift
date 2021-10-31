//
//  Created by Cihat Gündüz on 23.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import SwiftyBeaver
import UIKit

let log = SwiftyBeaver.self

final class Logger {
  static let shared = Logger()

  func setup() {
    // log to console
    let consoleDestination = ConsoleDestination()
    #if DEBUG
      consoleDestination.minLevel = .debug
    #else
      consoleDestination.minLevel = .warning
    #endif
    log.addDestination(consoleDestination)

    // log to file
    let fileDestination = FileDestination()
    fileDestination.minLevel = .info
    log.addDestination(fileDestination)
  }
}
