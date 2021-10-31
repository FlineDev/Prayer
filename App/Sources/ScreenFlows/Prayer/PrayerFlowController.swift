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
  private let changingTextSpeedFactor: Double
  private let showChangingTextName: Bool
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
    changingTextSpeedFactor: Double,
    showChangingTextName: Bool,
    audioMode: AudioMode,
    movementSoundInstrument: String,
    speechSynthesizer: SpeechSynthesizer
  ) {
    self.prayer = prayer
    self.fixedTextSpeedsFactor = fixedTextSpeedsFactor
    self.changingTextSpeedFactor = changingTextSpeedFactor
    self.showChangingTextName = showChangingTextName
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
    countdown = Countdown(startValue: countdownCount)
    countdown?
      .onCount { count in
        self.prayerViewCtrl.viewModel = self.countdownViewModel(count: count)

        switch self.audioMode {
        case .speechSynthesizer, .movementSoundAndSpeechSynthesizer:
          self.speechSynthesizer.speak(text: String(count))

        case .movementSound, .none:
          break
        }
      }

    countdown?.onFinish { self.startPrayer() }

    let navCtrl = UINavigationController(rootViewController: prayerViewCtrl)
    navCtrl.modalPresentationStyle = .fullScreen
    presentingViewController.present(navCtrl, animated: true) {
      self.prayerViewCtrl.viewModel = self.countdownViewModel(count: countdownCount)
      self.countdown?.start()

      switch self.audioMode {
      case .speechSynthesizer, .movementSoundAndSpeechSynthesizer:
        self.speechSynthesizer.speak(text: String(countdownCount))

      case .movementSound, .none:
        break
      }
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
      nextIsComponentBeginning: true
    )
  }

  func startPrayer() {
    prayerState = PrayerState(
      prayer: prayer,
      changingTextSpeedFactor: changingTextSpeedFactor,
      fixedTextsSpeedFactor: fixedTextSpeedsFactor,
      audioMode: audioMode,
      movementSoundInstrument: movementSoundInstrument,
      speechSynthesizer: speechSynthesizer
    )
    prayerViewCtrl.viewModel = prayerState.prayerViewModel()
    progressPrayer()

    // set audio session to this app
    try? AVAudioSession.sharedInstance().setActive(true)

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
        completion: progressToNextStep,
        delayCompletion: prayerState.movementDelay
      )

    case .movementSoundAndSpeechSynthesizer:
      if let movementSoundUrl = prayerState.currentMovementSoundUrl {
        AudioPlayer.shared.playSound(at: movementSoundUrl)
      }

      speechSynthesizer.speak(
        text: prayerState.currentLine,
        completion: progressToNextStep,
        delayCompletion: prayerState.movementDelay
      )

    case .none:
      timer = Timer.after(prayerState.currentLineReadingTime, progressToNextStep)
    }
  }

  private func progressToNextStep() {
    if prayerState.moveToNextLine() {
      let viewModel = prayerState.prayerViewModel()

      // show changing text info if chosen
      if self.showChangingTextName && viewModel.currentIsComponentBeginning {
        if let chapterNum = prayerState.currentRecitationChapterNum, chapterNum != 1 {
          let infoViewModel = PrayerViewModel(
            currentComponentName: viewModel.currentComponentName,
            previousArrow: viewModel.previousArrow,
            previousLine: viewModel.previousLine,
            currentArrow: nil,
            currentLine: viewModel.currentComponentName,
            isChapterName: true,
            currentIsComponentBeginning: true,
            nextArrow: nil,
            nextLine: viewModel.currentLine,
            nextIsComponentBeginning: false
          )
          self.prayerViewCtrl.viewModel = infoViewModel

          switch audioMode {
          case .movementSound, .none:
            let rememberTime = Timespan.milliseconds(1_000)
            let waitTime = infoViewModel.currentLine.estimatedReadingTime + rememberTime
            delay(by: waitTime) {
              self.prayerViewCtrl.viewModel = self.prayerState.prayerViewModel()
              self.progressPrayer()
            }

          case .speechSynthesizer, .movementSoundAndSpeechSynthesizer:
            speechSynthesizer.speak(text: infoViewModel.currentLine) {
              self.prayerViewCtrl.viewModel = self.prayerState.prayerViewModel()
              self.progressPrayer()
            }
          }

          return
        }
      }

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
    try? AVAudioSession.sharedInstance().setActive(false)
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
