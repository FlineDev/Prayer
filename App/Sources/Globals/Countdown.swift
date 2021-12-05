//
//  Created by Cihat Gündüz on 25.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import SwiftyTimer
import UIKit

class Countdown {
  private let automaticallyCountEvery: TimeInterval?
  private var currentValue: Int
  private var timer: Timer?

  private var countClosure: ((_ count: Int) -> Void)?
  private var finishClosure: (() -> Void)?

  /// Initializes a countdown.
  ///
  /// - Parameters:
  ///   - startValue: The value to start counting down from.
  ///   - automaticallyCountEvery: The `TimeInterval` of the step to wait between every count. Specify `nil` to turn off automatic counting, call `stepDown()` manually.
  init(
    startValue: Int,
    automaticallyCountEvery: TimeInterval?
  ) {
    self.automaticallyCountEvery = automaticallyCountEvery
    self.currentValue = startValue
  }

  /// Starts the automatic counting.
  func start() {
    countClosure?(currentValue)

    if let automaticallyCountEvery = automaticallyCountEvery {
      timer = Timer.after(automaticallyCountEvery) {
        self.currentValue -= 1

        if self.currentValue > 0 {
          self.countClosure?(self.currentValue)
          self.start()
        }
        else {
          self.finishClosure?()
          self.cleanup()
        }
      }
    }
  }

  /// Only call this if `automaticallyCountEvery` was set to `nil` to manually count down.
  func stepDown() {
    currentValue -= 1

    if currentValue > 0 {
      countClosure?(currentValue)
    }
    else {
      finishClosure?()
      cleanup()
    }
  }

  /// Cancels the automatic counting.
  func cancel() { cleanup() }

  func onCount(closure: @escaping (_ count: Int) -> Void) {
    countClosure = closure
  }

  /// Called on both the automatic or manual counting when count reaches 0.
  func onFinish(closure: @escaping () -> Void) {
    finishClosure = closure
  }

  private func cleanup() {
    timer?.invalidate()
    timer = nil
    countClosure = nil
    finishClosure = nil
  }
}
