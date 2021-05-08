//
//  Created by Cihat Gündüz on 24.02.19.
//  Copyright © 2019 Flinesoft. All rights reserved.
//

import MungoHealer
import UIKit

var mungo: MungoHealer!

final class ErrorHandler {
  static let shared = ErrorHandler()

  func setup(window: UIWindow) {
    let errorHandler = AlertLogErrorHandler(window: window) { log.error($0) }
    mungo = MungoHealer(errorHandler: errorHandler)
  }
}
