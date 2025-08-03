//
//  Created by Cihat Gündüz on 23.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import AVKit
import Imperio
import SafariServices
import SwiftyUserDefaults
import UIKit

class SettingsFlowController: InitialFlowController {
   private let l10n = L10n.Settings.self
   var settingsViewModel: SettingsViewModel!
   var settingsViewCtrl: SettingsViewController!
   var faqViewCtrl: FAQViewController?

   override func start(from window: UIWindow) {
      self.settingsViewModel = SettingsViewModel()
      self.settingsViewCtrl = SettingsViewController(viewModel: self.settingsViewModel)
      self.settingsViewCtrl?.flowDelegate = self

      let navCtrl = UINavigationController(rootViewController: settingsViewCtrl)
      window.rootViewController = navCtrl

      if !Defaults.faqClosed {
         showFAQ()
      }
   }
}

extension SettingsFlowController: SettingsFlowDelegate {
   func setRakat(_ rakatCount: Int) {
      self.settingsViewModel.rakatCount = rakatCount
   }

   func setFixedPartSpeed(_ fixedPartSpeed: Double) {
      self.settingsViewModel.fixedTextsSpeedFactor = fixedPartSpeed
   }

   func setChangingPartSpeed(_ changingPartSpeed: Double) {
      self.settingsViewModel.recitationSpeedFactor = changingPartSpeed
   }

   func setShowChangingTextName(_ showChangingTextName: Bool) {
      self.settingsViewModel.showRecitationName = showChangingTextName
   }

   func setAllowLongerRecitations(_ allowLongerRecitations: Bool) {
      self.settingsViewModel.allowLongerRecitations = allowLongerRecitations
   }

   func setAllowSplittingRecitations(_ allowSplittingRecitations: Bool) {
      self.settingsViewModel.allowSplittingRecitations = allowSplittingRecitations
   }

   func setSpeechSynthesizerVoice(_ voice: AVSpeechSynthesisVoice) {
      self.settingsViewModel.speechSynthesizerVoice = voice
   }

   func setSpeechSynthesizerSpeechRate(_ speechRate: Float) {
      self.settingsViewModel.speechSynthesizerSpeechRate = speechRate
   }

   func setSpeechSynthesizerPitchMultiplier(_ pitchMultiplier: Float) {
      self.settingsViewModel.speechSynthesizerPitchMultiplier = pitchMultiplier
   }

   func setAudioMode(_ audioMode: AudioMode) {
      self.settingsViewModel.audioMode = audioMode
   }

   func showLanguageSettings() {
      UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
   }

   func chooseInstrument(_ instrument: String) {
      self.settingsViewModel.movementSoundInstrument = instrument

      if let moveSoundUrl = AudioPlayer.shared.movementSoundUrl(name: "E-Short", instrument: instrument) {
         AudioPlayer.shared.playSound(at: moveSoundUrl)
      }
   }

   func didPressFAQButton() {
      self.showFAQ()
   }

   func didPressFeedbackButton() {
      self.showFeedbackCommunity()
   }

   func startPrayer() {
      guard self.settingsViewModel.rakatCount > 0 else { return }
      let prayer = Prayer(
         rakatCount: UInt(settingsViewModel.rakatCount),
         allowLongerRecitations: self.settingsViewModel.allowLongerRecitations,
         allowSplittingRecitations: self.settingsViewModel.allowSplittingRecitations,
         showStandingRecitationName: self.settingsViewModel.showRecitationName
      )

      let prayerFlowCtrl = PrayerFlowController(
         prayer: prayer,
         fixedTextSpeedsFactor: settingsViewModel.fixedTextsSpeedFactor,
         recitationSpeedFactor: self.settingsViewModel.recitationSpeedFactor,
         audioMode: self.settingsViewModel.audioMode,
         movementSoundInstrument: self.settingsViewModel.movementSoundInstrument,
         speechSynthesizer: self.settingsViewModel.speechSynthesizer
      )

      add(subFlowController: prayerFlowCtrl)
      prayerFlowCtrl.start(from: self.settingsViewCtrl)
   }

   private func showFAQ() {
      let faqNavCtrl = StoryboardScene.Settings.faqNavigationController.instantiate()
      self.faqViewCtrl = faqNavCtrl.topViewController as? FAQViewController
      let localL10n = self.l10n.FaqEntries.self

      self.faqViewCtrl?.viewModel = FAQViewModel(
         entries: [
            (question: localL10n.AppMotivation.Question.string, answer: localL10n.AppMotivation.Answer.string),
            (question: localL10n.IpadReading.Question.string, answer: localL10n.IpadReading.Answer.string),
            (question: localL10n.Language.Question.string, answer: localL10n.Language.Answer.string),
            (question: localL10n.TranslationProblem.Question.string, answer: localL10n.TranslationProblem.Answer.string),
         ]
      )

      self.faqViewCtrl?.flowDelegate = self
      self.settingsViewCtrl.present(faqNavCtrl, animated: true, completion: nil)
   }

   func showFeedbackCommunity() {
      let communityUrl = URL(string: "https://github.com/FlineDev/Prayer/issues")!
      let safariViewCtrl = SFSafariViewController(url: communityUrl)

      self.settingsViewCtrl.present(safariViewCtrl, animated: true, completion: nil)
   }
}

extension SettingsFlowController: FAQFlowDelegate {
   func doneButtonPressed() {
      Defaults.faqClosed = true
      self.faqViewCtrl?.dismiss(animated: true, completion: nil)
   }
}

extension DefaultsKeys {
   var faqClosed: DefaultsKey<Bool> { .init("faqClosed", defaultValue: false) }
}
