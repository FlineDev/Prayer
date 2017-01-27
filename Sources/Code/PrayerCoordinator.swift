//
//  PrayerCoordinator.swift
//  Prayer
//
//  Created by Cihat Gündüz on 24.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import Imperio

enum PrayerAction {
    case doneButtonPressed
}

class PrayerCoordinator: Coordinator {
    // MARK: - Stored Instance Properties

    private let salah: Salah
    private let fixedTextSpeedsFactor: Double
    private let changingTextSpeedFactor: Double
    private let movementSoundInstrument: String

    private var prayerState: PrayerState!
    private var prayerViewCtrl: PrayerViewController!
    private var countdown: Countdown?

    private var timer: Timer?


    // MARK: - Computed Instance Properties

    override var mainViewController: UIViewController? {
        return prayerViewCtrl
    }


    // MARK: - Initializers

    init(presentingViewController: UIViewController, salah: Salah, fixedTextSpeedsFactor: Double,
         changingTextSpeedFactor: Double, movementSoundInstrument: String) {
        self.salah = salah
        self.fixedTextSpeedsFactor = fixedTextSpeedsFactor
        self.changingTextSpeedFactor = changingTextSpeedFactor
        self.movementSoundInstrument = movementSoundInstrument

        super.init(presentingViewController: presentingViewController)
    }


    // MARK: - Instance Methods

    override func start() {
        super.start()

        // configure prayer view controller
        prayerViewCtrl = StoryboardScene.Prayer.initialViewController()

        weak var weakSelf = self
        prayerViewCtrl.coordinate = { action in
            switch action {
            case .doneButtonPressed:
                weakSelf?.countdown?.cancel()
                weakSelf?.cleanup()
                weakSelf?.finish()
            }
        }

        // initialize countdown
        let countdownCount = 5
        countdown = Countdown(startValue: countdownCount)
        countdown?.onCount { count in
            self.prayerViewCtrl.viewModel = self.countdownViewModel(count: count)
        }
        countdown?.onFinish { self.startPrayer() }

        let navCtrl = BrandedNavigationController(rootViewController: prayerViewCtrl)
        present(navCtrl, style: .modal(completion: {
            self.prayerViewCtrl.viewModel = self.countdownViewModel(count: countdownCount)
            self.countdown?.start()
        }))
    }

    func countdownViewModel(count: Int) -> PrayerViewModel {
        return PrayerViewModel(
            currentComponentName: L10n.PrayerView.Countdown.name,
            previousArrow: nil, previousLine: nil, currentArrow: nil,
            currentLine: "\(count)", currentIsComponentBeginning: false,
            nextArrow: nil, nextLine: nil, nextIsComponentBeginning: true,
            movementSoundUrl: nil
        )
    }

    func startPrayer() {
        prayerState = PrayerState(
            salah: salah,
            changingTextSpeedFactor: changingTextSpeedFactor,
            fixedTextsSpeedFactor: fixedTextSpeedsFactor,
            movementSoundInstrument: movementSoundInstrument
        )
        prayerViewCtrl.viewModel = prayerState.prayerViewModel()
        progressPrayer()

        // prevent screen from locking
        UIApplication.shared.isIdleTimerDisabled = true
    }

    func progressPrayer() {
        timer = Timer.after(prayerState.currentLineReadingTime) {
            if self.prayerState.moveToNextLine() {
                self.prayerViewCtrl.viewModel = self.prayerState.prayerViewModel()
                self.progressPrayer()
            } else {
                self.cleanup()
                self.finish()
            }
        }
    }

    func cleanup() {
        timer?.invalidate()
        timer = nil
        UIApplication.shared.isIdleTimerDisabled = false
    }


//    func finish() {
//        currentTimer?.invalidate()
//        currentTimer = nil
//    }
//
//    private var currentTimer: Timer?
//    private var currentRakahIndex = 0
//    private var currentComponentIndex = 0 {
//        didSet {
//            title = salah.rakat[currentRakahIndex].components()[currentComponentIndex].name
//        }
//    }
//    private var currentSpokenTextLine = 0
//
//
//
//    private func progressPrayer(completion: @escaping () -> Void) {
//        if moveOnToNextLine() {
//            if let currentLineText = currentLineText {
//                let duration: TimeInterval = {
//                    if currentSpokenTextLine == 0 && self.salah.rakat[currentRakahIndex].components()[currentComponentIndex].needsMovement {
//                        return RakahComponent.lineChangeDuration.timeInterval + currentLineText.estimatedReadingTime
//                    } else {
//                        return currentLineText.estimatedReadingTime
//                    }
//                }()
//
//
//                currentTimer = Timer.after(duration / textSpeedFactor) {
//                    self.progressPrayer(completion: completion)
//                }
//            }
//        } else {
//            completion()
//        }
//
//        updateLabels()
//        updateIcons()
//        updateSeparators()
//    }
//    

}
