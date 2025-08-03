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
      self.prayerViewCtrl = StoryboardScene.PrayerView.initialScene.instantiate()
      self.prayerViewCtrl.flowDelegate = self

      // initialize countdown
      let countdownCount = 5
      switch self.audioMode {
      case .speechSynthesizer, .movementSoundAndSpeechSynthesizer:
         self.countdown = Countdown(startValue: countdownCount, automaticallyCountEvery: nil)
         self.countdown?
            .onCount { count in
               self.prayerViewCtrl.viewModel = self.countdownViewModel(count: count)
               self.speechSynthesizer.speak(
                  text: String(count),
                  afterStart: { [weak self] in self?.countdown?.stepDown() },
                  afterStartDelay: .seconds(1)
               )
            }

      case .movementSound, .none:
         self.countdown = Countdown(startValue: countdownCount, automaticallyCountEvery: .seconds(1))
         self.countdown?
            .onCount { count in
               self.prayerViewCtrl.viewModel = self.countdownViewModel(count: count)
            }
      }

      self.countdown?.onFinish { self.startPrayer() }

      let navCtrl = UINavigationController(rootViewController: prayerViewCtrl)
      navCtrl.modalPresentationStyle = .fullScreen
      presentingViewController.present(navCtrl, animated: true) {
         self.countdown?.start()
      }
   }

   func countdownViewModel(count: Int) -> PrayerViewModel {
      PrayerViewModel(
         currentComponentName: L10n.PrayerView.Countdown.Name.string,
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
      self.prayerState = PrayerState(
         prayer: self.prayer,
         changingTextSpeedFactor: self.recitationSpeedFactor,
         fixedTextsSpeedFactor: self.fixedTextSpeedsFactor,
         audioMode: self.audioMode,
         movementSoundInstrument: self.movementSoundInstrument,
         speechSynthesizer: self.speechSynthesizer
      )
      self.prayerViewCtrl.viewModel = self.prayerState.prayerViewModel()
      self.progressPrayer()

      // set audio session to this app
      try? AVAudioSession.sharedInstance().setActive(true)
      if #available(iOS 14.5, *) {
         try? AVAudioSession.sharedInstance().setPrefersNoInterruptionsFromSystemAlerts(true)
      }

      // prevent screen from locking
      UIApplication.shared.isIdleTimerDisabled = true
   }

   func progressPrayer() {
      switch self.audioMode {
      case .movementSound:
         if let movementSoundUrl = prayerState.currentMovementSoundUrl {
            AudioPlayer.shared.playSound(at: movementSoundUrl)
         }

         self.timer = Timer.after(self.prayerState.currentLineReadingTime, self.progressToNextStep)

      case .speechSynthesizer:
         self.speechSynthesizer.speak(
            text: self.prayerState.currentLine,
            afterCompletion: self.progressToNextStep,
            afterCompletionDelay: self.prayerState.movementDelay
         )

      case .movementSoundAndSpeechSynthesizer:
         if let movementSoundUrl = prayerState.currentMovementSoundUrl {
            AudioPlayer.shared.playSound(at: movementSoundUrl)
         }

         self.speechSynthesizer.speak(
            text: self.prayerState.currentLine,
            afterCompletion: self.progressToNextStep,
            afterCompletionDelay: self.prayerState.movementDelay
         )

      case .none:
         self.timer = Timer.after(self.prayerState.currentLineReadingTime, self.progressToNextStep)
      }
   }

   private func progressToNextStep() {
      if self.prayerState.moveToNextLine() {
         self.prayerViewCtrl.viewModel = self.prayerState.prayerViewModel()
         self.progressPrayer()
      } else {
         self.cleanup()
         self.prayerViewCtrl.dismiss(animated: true, completion: nil)
         removeFromSuperFlowController()
      }
   }

   private func cleanup() {
      self.timer?.invalidate()
      self.timer = nil
      self.speechSynthesizer.stop()
   }
}

extension PrayerFlowController: PrayerFlowDelegate {
   func doneButtonPressed() {
      self.countdown?.cancel()
      self.cleanup()
      self.prayerViewCtrl.dismiss(animated: true) {
         if #available(iOS 14.5, *) {
            try? AVAudioSession.sharedInstance().setPrefersNoInterruptionsFromSystemAlerts(false)
         }
         try? AVAudioSession.sharedInstance().setActive(false)
         UIApplication.shared.isIdleTimerDisabled = false
      }
      removeFromSuperFlowController()
   }
}
