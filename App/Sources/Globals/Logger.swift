//
//  Created by Cihat Gündüz on 23.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import SwiftyBeaver
import UIKit

// MARK: - Global Objects
let log = SwiftyBeaver.self

// MARK: - Helper Class
final class Logger {
    // MARK: - Stored Type Properties
    static let shared = Logger()

    // MARK: - Instance Properties
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
