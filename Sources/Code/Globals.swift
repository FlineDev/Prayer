//
//  Globals.swift
//  Prayer
//
//  Created by Cihat Gündüz on 23.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import SwiftyBeaver

// MARK: - Global Objects

let log = SwiftyBeaver.self


// MARK: - Helper Class

class Globals {
    static func configureLogger() {
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
