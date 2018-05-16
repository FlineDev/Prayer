//
//  Countdown.swift
//  Prayer
//
//  Created by Cihat Gündüz on 25.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import SwiftyTimer

class Countdown {
    // MARK: - Stored Instance Properties
    private var currentValue: Int
    private var timer: Timer?

    private var countClosure: ((_ count: Int) -> Void)?
    private var finishClosure: (() -> Void)?

    // MARK: - Initializers
    init(startValue: Int) {
        self.currentValue = startValue
    }

    // MARK: - Instance Methods
    func start() {
        timer = Timer.after(1) {
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

    func cancel() { cleanup() }

    func onCount(closure: @escaping (_ count: Int) -> Void) {
        countClosure = closure
    }

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
