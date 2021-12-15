//
//  Created by Cihat Gündüz on 24.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import AVKit
import HandySwift
import Imperio
import UIKit

class PrayerFlowController: FlowController {
  private let prayer: Prayer
  private let fixedTextSpeedsFactor: Double
  private let recitationSpeedFactor: Double
  private var audioMode: AudioMode
  private let movementSoundInstrument: String

  private var prayerState: PrayerState!
  private var prayerViewCtrl: PrayerViewController!
  private var countdown: Countdown?

  private var timer: Timer?
  private var speechSynthesizer: SpeechSynthesizer

  init(
    prayer: Prayer,
    fixedTextSpeedsFactor: Double,
    recitationSpeedFactor: Double,
    audioMode: AudioMode,
    movementSoundInstrument: String,
    speechSynthesizer: SpeechSynthesizer
  ) {
    self.prayer = prayer
    self.fixedTextSpeedsFactor = fixedTextSpeedsFactor
    self.recitationSpeedFactor = recitationSpeedFactor
    self.audioMode = audioMode
    self.movementSoundInstrument = movementSoundInstrument
    self.speechSynthesizer = speechSynthesizer
  }

  override func start(from presentingViewController: UIViewController) {
    // configure prayer view controller
    prayerViewCtrl = StoryboardScene.PrayerView.initialScene.instantiate()
    prayerViewCtrl.flowDelegate = self

    // initialize countdown
    let countdownCount = 5
    switch audioMode {
    case .speechSynthesizer, .movementSoundAndSpeechSynthesizer:
      countdown = Countdown(startValue: countdownCount, automaticallyCountEvery: nil)
      countdown?
        .onCount { count in
          self.prayerViewCtrl.viewModel = self.countdownViewModel(count: count)
          self.speechSynthesizer.speak(
            text: String(count),
            afterStart: { [weak self] in self?.countdown?.stepDown() },
            afterStartDelay: .seconds(1)
          )
        }

    case .movementSound, .none:
      countdown = Countdown(startValue: countdownCount, automaticallyCountEvery: .seconds(1))
      countdown?
        .onCount { count in
          self.prayerViewCtrl.viewModel = self.countdownViewModel(count: count)
        }
    }

    countdown?.onFinish { self.startPrayer() }

    let navCtrl = UINavigationController(rootViewController: prayerViewCtrl)
    navCtrl.modalPresentationStyle = .fullScreen
    presentingViewController.present(navCtrl, animated: true) {
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
      currentIsComponentBeginning: false,
      nextArrow: nil,
      nextLine: nil,
      nextIsComponentBeginning: true
    )
  }

  func startPrayer() {
    prayerState = PrayerState(
      prayer: prayer,
      changingTextSpeedFactor: recitationSpeedFactor,
      fixedTextsSpeedFactor: fixedTextSpeedsFactor,
      audioMode: audioMode,
      movementSoundInstrument: movementSoundInstrument,
      speechSynthesizer: speechSynthesizer
    )
    prayerViewCtrl.viewModel = prayerState.prayerViewModel()
    progressPrayer()

    // set audio session to this app
    try? AVAudioSession.sharedInstance().setActive(true)
    if #available(iOS 14.5, *) {
      try? AVAudioSession.sharedInstance().setPrefersNoInterruptionsFromSystemAlerts(true)
    }

    // prevent screen from locking
    UIApplication.shared.isIdleTimerDisabled = true
  }

  func progressPrayer() {
    switch audioMode {
    case .movementSound:
      if let movementSoundUrl = prayerState.currentMovementSoundUrl {
        AudioPlayer.shared.playSound(at: movementSoundUrl)
      }

      timer = Timer.after(prayerState.currentLineReadingTime, progressToNextStep)

    case .speechSynthesizer:
      speechSynthesizer.speak(
        text: prayerState.currentLine,
        afterCompletion: progressToNextStep,
        afterCompletionDelay: prayerState.movementDelay
      )

    case .movementSoundAndSpeechSynthesizer:
      if let movementSoundUrl = prayerState.currentMovementSoundUrl {
        AudioPlayer.shared.playSound(at: movementSoundUrl)
      }

      speechSynthesizer.speak(
        text: prayerState.currentLine,
        afterCompletion: progressToNextStep,
        afterCompletionDelay: prayerState.movementDelay
      )

    case .none:
      timer = Timer.after(prayerState.currentLineReadingTime, progressToNextStep)
    }
  }

  private func progressToNextStep() {
    if prayerState.moveToNextLine() {
      prayerViewCtrl.viewModel = prayerState.prayerViewModel()
      progressPrayer()
    }
    else {
      cleanup()
      prayerViewCtrl.dismiss(animated: true, completion: nil)
      removeFromSuperFlowController()
    }
  }

  private func cleanup() {
    timer?.invalidate()
    timer = nil
    speechSynthesizer.stop()
  }
}

extension PrayerFlowController: PrayerFlowDelegate {
  func doneButtonPressed() {
    countdown?.cancel()
    cleanup()
    prayerViewCtrl.dismiss(animated: true) {
      if #available(iOS 14.5, *) {
        try? AVAudioSession.sharedInstance().setPrefersNoInterruptionsFromSystemAlerts(false)
      }
      try? AVAudioSession.sharedInstance().setActive(false)
      UIApplication.shared.isIdleTimerDisabled = false
    }
    removeFromSuperFlowController()
  }
}
