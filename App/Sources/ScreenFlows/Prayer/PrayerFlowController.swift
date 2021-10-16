//
//  Created by Cihat Gündüz on 24.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import HandySwift
import Imperio
import UIKit

class PrayerFlowController: FlowController {
  // MARK: - Stored Instance Properties
  private let prayer: Prayer
  private let fixedTextSpeedsFactor: Double
  private let changingTextSpeedFactor: Double
  private let showChangingTextName: Bool
  private let movementSoundInstrument: String

  private var prayerState: PrayerState!
  private var prayerViewCtrl: PrayerViewController!
  private var countdown: Countdown?

  private var timer: Timer?

  // MARK: - Initializers
  init(
    prayer: Prayer,
    fixedTextSpeedsFactor: Double,
    changingTextSpeedFactor: Double,
    showChangingTextName: Bool,
    movementSoundInstrument: String
  ) {
    self.prayer = prayer
    self.fixedTextSpeedsFactor = fixedTextSpeedsFactor
    self.changingTextSpeedFactor = changingTextSpeedFactor
    self.showChangingTextName = showChangingTextName
    self.movementSoundInstrument = movementSoundInstrument
  }

  // MARK: - Instance Methods
  override func start(from presentingViewController: UIViewController) {
    // configure prayer view controller
    prayerViewCtrl = StoryboardScene.PrayerView.initialScene.instantiate()
    prayerViewCtrl.flowDelegate = self

    // initialize countdown
    let countdownCount = 5
    countdown = Countdown(startValue: countdownCount)
    countdown?
      .onCount { count in
        self.prayerViewCtrl.viewModel = self.countdownViewModel(count: count)
      }

    countdown?.onFinish { self.startPrayer() }

    let navCtrl = UINavigationController(rootViewController: prayerViewCtrl)
    navCtrl.modalPresentationStyle = .fullScreen
    presentingViewController.present(navCtrl, animated: true) {
      self.prayerViewCtrl.viewModel = self.countdownViewModel(count: countdownCount)
      self.countdown?.start()
    }
  }

  func countdownViewModel(count: Int) -> PrayerViewModel {
    PrayerViewModel(
      currentComponentName: L10n.PrayerView.Countdown.name,
      previousArrow: nil,
      previousLine: nil,
      currentArrow: nil,
      currentLine: "\(count)",
      isChapterName: false,
      currentIsComponentBeginning: false,
      nextArrow: nil,
      nextLine: nil,
      nextIsComponentBeginning: true,
      movementSoundUrl: nil
    )
  }

  func startPrayer() {
    prayerState = PrayerState(
      prayer: prayer,
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
              currentComponentName: viewModel.currentComponentName,
              previousArrow: viewModel.previousArrow,
              previousLine: viewModel.previousLine,
              currentArrow: nil,
              currentLine: "📖\(chapterNum): \(viewModel.currentComponentName)",
              isChapterName: true,
              currentIsComponentBeginning: true,
              nextArrow: nil,
              nextLine: viewModel.currentLine,
              nextIsComponentBeginning: false,
              movementSoundUrl: viewModel.movementSoundUrl
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
      }
      else {
        self.cleanup()
        self.prayerViewCtrl.dismiss(animated: true, completion: nil)
        self.removeFromSuperFlowController()
      }
    }
  }

  func cleanup() {
    timer?.invalidate()
    timer = nil
    UIApplication.shared.isIdleTimerDisabled = false
  }
}

extension PrayerFlowController: PrayerFlowDelegate {
  func doneButtonPressed() {
    countdown?.cancel()
    cleanup()
    prayerViewCtrl.dismiss(animated: true, completion: nil)
    removeFromSuperFlowController()
  }
}
