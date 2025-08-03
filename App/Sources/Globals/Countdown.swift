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
      self.countClosure?(self.currentValue)

      if let automaticallyCountEvery = automaticallyCountEvery {
         self.timer = Timer.after(automaticallyCountEvery) {
            self.currentValue -= 1

            if self.currentValue > 0 {
               self.countClosure?(self.currentValue)
               self.start()
            } else {
               self.finishClosure?()
               self.cleanup()
            }
         }
      }
   }

   /// Only call this if `automaticallyCountEvery` was set to `nil` to manually count down.
   func stepDown() {
      self.currentValue -= 1

      if self.currentValue > 0 {
         self.countClosure?(self.currentValue)
      } else {
         self.finishClosure?()
         self.cleanup()
      }
   }

   /// Cancels the automatic counting.
   func cancel() { self.cleanup() }

   func onCount(closure: @escaping (_ count: Int) -> Void) {
      self.countClosure = closure
   }

   /// Called on both the automatic or manual counting when count reaches 0.
   func onFinish(closure: @escaping () -> Void) {
      self.finishClosure = closure
   }

   private func cleanup() {
      self.timer?.invalidate()
      self.timer = nil
      self.countClosure = nil
      self.finishClosure = nil
   }
}
