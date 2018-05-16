//
//  Created by Cihat Gündüz on 24.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import HandySwift
import Imperio
import UIKit

class PrayerCoordinator: Coordinator {
    // MARK: - Stored Instance Properties
    private let salah: Salah
    private let fixedTextSpeedsFactor: Double
    private let changingTextSpeedFactor: Double
    private let showChangingTextName: Bool
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
         changingTextSpeedFactor: Double, showChangingTextName: Bool, movementSoundInstrument: String) {
        self.salah = salah
        self.fixedTextSpeedsFactor = fixedTextSpeedsFactor
        self.changingTextSpeedFactor = changingTextSpeedFactor
        self.showChangingTextName = showChangingTextName
        self.movementSoundInstrument = movementSoundInstrument

        super.init(presentingViewController: presentingViewController)
    }

    // MARK: - Instance Methods
    override func start() {
        super.start()

        // configure prayer view controller
        prayerViewCtrl = StoryboardScene.PrayerView.initialScene.instantiate()

        prayerViewCtrl.coordinate = { [unowned self] action in
            switch action {
            case .doneButtonPressed:
                self.countdown?.cancel()
                self.cleanup()
                self.finish()
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
            currentLine: "\(count)", isChapterName: false, currentIsComponentBeginning: false,
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
                let viewModel = self.prayerState.prayerViewModel()

                // show changing text info if chosen
                if self.showChangingTextName && viewModel.currentIsComponentBeginning {
                    if let chapterNum = self.prayerState.currentRecitationChapterNum {
                        let infoViewModel = PrayerViewModel(
                            currentComponentName: viewModel.currentComponentName, previousArrow: viewModel.previousArrow,
                            previousLine: viewModel.previousLine, currentArrow: nil,
                            currentLine: "📖\(chapterNum): \(viewModel.currentComponentName)", isChapterName: true,
                            currentIsComponentBeginning: true, nextArrow: nil, nextLine: viewModel.currentLine,
                            nextIsComponentBeginning: false, movementSoundUrl: viewModel.movementSoundUrl
                        )
                        self.prayerViewCtrl.viewModel = infoViewModel

                        let rememberTime = Timespan.milliseconds(1_000)
                        let waitTime = infoViewModel.currentLine.estimatedReadingTime + rememberTime
                        delay(by: waitTime) {
                            self.prayerViewCtrl.viewModel = self.prayerState.prayerViewModel()
                            self.progressPrayer()
                        }

                        return
                    }
                }

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
}
