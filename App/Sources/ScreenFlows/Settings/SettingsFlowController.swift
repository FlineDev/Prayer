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
  // MARK: - Stored Instance Properties
  private let l10n = L10n.Settings.self
  var settingsViewModel: SettingsViewModel!
  var settingsViewCtrl: SettingsViewController!
  var faqViewCtrl: FAQViewController?

  // MARK: - Coordinator Methods
  override func start(from window: UIWindow) {
    settingsViewModel = SettingsViewModel()
    settingsViewCtrl = SettingsViewController(viewModel: settingsViewModel)
    settingsViewCtrl?.flowDelegate = self

    let navCtrl = UINavigationController(rootViewController: settingsViewCtrl)
    window.rootViewController = navCtrl

    if !Defaults.faqClosed {
      showFAQ()
    }
  }
}

extension SettingsFlowController: SettingsFlowDelegate {
  func setRakat(_ rakatCount: Int) {
    settingsViewModel.rakatCount = rakatCount
  }

  func setFixedPartSpeed(_ fixedPartSpeed: Double) {
    settingsViewModel.fixedTextsSpeedFactor = fixedPartSpeed
  }

  func setChangingPartSpeed(_ changingPartSpeed: Double) {
    settingsViewModel.changingTextSpeedFactor = changingPartSpeed
  }

  func setShowChangingTextName(_ showChangingTextName: Bool) {
    settingsViewModel.showChangingTextName = showChangingTextName
  }

  func setAllowLongerRecitations(_ allowLongerRecitations: Bool) {
    settingsViewModel.allowLongerRecitations = allowLongerRecitations
  }

  func setAllowSplittingRecitations(_ allowSplittingRecitations: Bool) {
    settingsViewModel.allowSplittingRecitations = allowSplittingRecitations
  }

  func setSpeechSynthesizerVoice(_ voice: AVSpeechSynthesisVoice?) {
    settingsViewModel.speechSynthesizerVoice = voice
  }

  func setSpeechSynthesizerSpeechRate(_ speechRate: Float) {
    settingsViewModel.speechSynthesizerSpeechRate = speechRate
  }

  func setSpeechSynthesizerPitchMultiplier(_ pitchMultiplier: Float) {
    settingsViewModel.speechSynthesizerPitchMultiplier = pitchMultiplier
  }

  func setAudioMode(_ audioMode: AudioMode) {
    settingsViewModel.audioMode = audioMode
  }

  func showLanguageSettings() {
    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
  }

  func chooseInstrument(_ instrument: String) {
    settingsViewModel.movementSoundInstrument = instrument

    if let moveSoundUrl = AudioPlayer.shared.movementSoundUrl(name: "E-Short", instrument: instrument) {
      AudioPlayer.shared.playSound(at: moveSoundUrl)
    }
  }

  func didPressFAQButton() {
    showFAQ()
  }

  func didPressFeedbackButton() {
    showFeedbackCommunity()
  }

  func startPrayer() {
    guard settingsViewModel.rakatCount > 0 else { return }
    let prayer = Prayer(
      rakatCount: UInt(settingsViewModel.rakatCount),
      allowLongerRecitations: settingsViewModel.allowLongerRecitations,
      allowSplittingRecitations: settingsViewModel.allowSplittingRecitations
    )

    let prayerFlowCtrl = PrayerFlowController(
      prayer: prayer,
      fixedTextSpeedsFactor: settingsViewModel.fixedTextsSpeedFactor,
      changingTextSpeedFactor: settingsViewModel.changingTextSpeedFactor,
      showChangingTextName: settingsViewModel.showChangingTextName,
      audioMode: settingsViewModel.audioMode,
      movementSoundInstrument: settingsViewModel.movementSoundInstrument,
      speechSynthesizer: settingsViewModel.speechSynthesizer
    )

    add(subFlowController: prayerFlowCtrl)
    prayerFlowCtrl.start(from: settingsViewCtrl)
  }

  private func showFAQ() {
    let faqNavCtrl = StoryboardScene.Settings.faqNavigationController.instantiate()
    faqViewCtrl = faqNavCtrl.topViewController as? FAQViewController
    let localL10n = l10n.FaqEntries.self

    faqViewCtrl?.viewModel = FAQViewModel(
      entries: [
        (question: localL10n.AppMotivation.question, answer: localL10n.AppMotivation.answer),
        (question: localL10n.IpadReading.question, answer: localL10n.IpadReading.answer),
        (question: localL10n.Language.question, answer: localL10n.Language.answer),
        (question: localL10n.LanguageMix.question, answer: localL10n.LanguageMix.answer),
        (question: localL10n.TranslationProblem.question, answer: localL10n.TranslationProblem.answer),
      ]
    )

    faqViewCtrl?.flowDelegate = self
    settingsViewCtrl.present(faqNavCtrl, animated: true, completion: nil)
  }

  func showFeedbackCommunity() {
    let communityUrl = URL(string: "https://links.flinesoft.com/forum/prayer")!
    let safariViewCtrl = SFSafariViewController(url: communityUrl)

    settingsViewCtrl.present(safariViewCtrl, animated: true, completion: nil)
  }
}

extension SettingsFlowController: FAQFlowDelegate {
  func doneButtonPressed() {
    Defaults.faqClosed = true
    faqViewCtrl?.dismiss(animated: true, completion: nil)
  }
}

extension DefaultsKeys {
  var faqClosed: DefaultsKey<Bool> { .init("faqClosed", defaultValue: false) }
}
