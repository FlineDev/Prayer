//
//  Created by Cihat Gündüz on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

// 4. Speaker / Bluetooth chooser

import AVKit
import Eureka
import HandySwift
import HandyUIKit
import Imperio
import SwiftyUserDefaults
import UIKit
import ViewRow

protocol SettingsFlowDelegate: AnyObject {
   func setRakat(_ rakatCount: Int)
   func setFixedPartSpeed(_ fixedPartSpeed: Double)
   func setChangingPartSpeed(_ changingPartSpeed: Double)
   func setShowChangingTextName(_ showChangingTextName: Bool)
   func setAllowLongerRecitations(_ allowLongerRecitations: Bool)
   func setAllowSplittingRecitations(_ allowSplittingRecitations: Bool)
   func setSpeechSynthesizerVoice(_ voice: AVSpeechSynthesisVoice)
   func setSpeechSynthesizerPitchMultiplier(_ pitchMultiplier: Float)
   func setSpeechSynthesizerSpeechRate(_ speechRate: Float)
   func setAudioMode(_ audioMode: AudioMode)
   func showLanguageSettings()
   func chooseInstrument(_ instrument: String)
   func startPrayer()
   func didPressFAQButton()
   func didPressFeedbackButton()
}

class SettingsViewController: FormViewController {
   let l10n = L10n.Settings.self
   var viewModel: SettingsViewModel

   private let audioModeRowTag: String = "AudioMode"

   weak var flowDelegate: SettingsFlowDelegate?

   private var audioMode: AudioMode? {
      UIDevice.current.userInterfaceIdiom == .pad
         ? (form.rowBy(tag: self.audioModeRowTag) as! SegmentedRow<AudioMode>).value
         : (form.rowBy(tag: self.audioModeRowTag) as! PushRow<AudioMode>).value
   }

   init(
      viewModel: SettingsViewModel
   ) {
      self.viewModel = viewModel

      super.init(style: .grouped)
   }

   @available(*, unavailable)
   required init?(
      coder aDecoder: NSCoder
   ) {
      fatalError("init(coder:) has not been implemented")
   }

   override func viewDidLoad() {
      super.viewDidLoad()

      title = L10n.Settings.Title.string

      self.setupAppSection()
      self.setupPrayerSection()
      self.setupAudioAndSpeedSection()
      self.setupStartSection()
      self.setupFAQButton()
      self.setupFeedbackButton()
   }

   private func setupAppSection() {
      let appSection =
         Section(header: l10n.AppSection.Title.string, footer: self.l10n.AppSection.Footer.string)
         <<< ButtonRow { row in
            row.title = self.l10n.AppSection.ChangeLanguageButton.Title.string
         }
         .cellSetup { cell, _ in
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
            cell.imageView?.image = UIImage(systemName: "flag")
         }
         .onCellSelection { _, _ in
            self.flowDelegate?.showLanguageSettings()
         }

      form.append(appSection)
   }

   private func setupPrayerSection() {
      let prayerSection =
         Section(header: l10n.PrayerSection.Title.string, footer: self.l10n.PrayerSection.Footer.string)
         <<< self.rakatCountRow()
         <<< self.changingTextNameRow()
         <<< self.allowLongerRecitationsRow()
         <<< self.allowSplittingRecitationsRow()

      form.append(prayerSection)
   }

   private func setupAudioAndSpeedSection() {
      let audioAndSpeedSection =
         Section(header: l10n.AudioSpeedSection.Title.string, footer: self.l10n.AudioSpeedSection.Footer.string)
         <<< (UIDevice.current.userInterfaceIdiom == .pad ? self.audioModeSegmentedRow() : self.audioModePushRow())
         <<< self.fixedTextSpeedRow()
         <<< self.changingTextSpeedRow()
         <<< self.movementSoundInstrumentRow()
         <<< self.speechSynthesizerVoiceRow()
         <<< self.speechSynthesizerSpeechRateRow()
         <<< self.speechSynthesizerPitchMultiplierRow()
         <<< self.volumeViewRow()

      form.append(audioAndSpeedSection)
   }

   private func audioModePushRow() -> PushRow<AudioMode> {
      PushRow<AudioMode>(self.audioModeRowTag) { row in
         row.title = self.l10n.AudioSpeedSection.AudioMode.Title.string
         row.options = AudioMode.allCases
         row.value = self.viewModel.audioMode
         row.displayValueFor = { $0?.displayDescription }
      }
      .cellSetup { cell, _ in
         cell.imageView?.image = UIImage(systemName: "waveform")
      }
      .onChange { row in
         guard let rowValue = row.value else {
            log.error("Audio mode row had nil value.")
            return
         }
         self.flowDelegate?.setAudioMode(rowValue)
      }
   }

   private func audioModeSegmentedRow() -> SegmentedRow<AudioMode> {
      SegmentedRow<AudioMode>(self.audioModeRowTag) { row in
         row.title = self.l10n.AudioSpeedSection.AudioMode.Title.string
         row.options = AudioMode.allCases
         row.value = self.viewModel.audioMode
         row.displayValueFor = { $0?.displayDescription }
      }
      .cellSetup { cell, _ in
         cell.imageView?.image = UIImage(systemName: "waveform")
      }
      .onChange { row in
         guard let rowValue = row.value else {
            log.error("Audio mode row had nil value.")
            return
         }
         self.flowDelegate?.setAudioMode(rowValue)
      }
   }

   private func rakatCountRow() -> IntRow {
      IntRow { row in
         row.title = self.l10n.PrayerSection.RakatCount.Title.string
         row.value = self.viewModel.rakatCount
      }
      .cellSetup { cell, _ in
         cell.imageView?.image = UIImage(systemName: "number")
      }
      .onCellHighlightChanged { cell, row in
         if cell.textField.isFirstResponder {
            row.value = nil
         }
      }
      .onChange { row in
         guard let rowValue = row.value else {
            log.error("Rakat row had nil value.")
            return
         }
         self.flowDelegate?.setRakat(rowValue)
      }
   }

   private func fixedTextSpeedRow() -> SliderRow {
      SliderRow { row in
         row.title = "🔂    " + self.l10n.AudioSpeedSection.FixedTexts.Title.string
         row.value = Float(self.viewModel.fixedTextsSpeedFactor)
         row.displayValueFor = { String(format: "%.2f", $0!) }
         row.cell.slider.minimumValue = 0.5
         row.cell.slider.maximumValue = 2.0
         row.steps = UInt((row.cell.slider.maximumValue - row.cell.slider.minimumValue) / 0.05)
         row.hidden = Condition.function([self.audioModeRowTag]) { _ in
            self.audioMode != .movementSound && self.audioMode != AudioMode.none
         }
      }
      .onChange { row in
         guard let rowValue = row.value else {
            log.error("Fixed text speed had nil value.")
            return
         }
         self.flowDelegate?.setFixedPartSpeed(Double(rowValue))
      }
   }

   private func changingTextSpeedRow() -> SliderRow {
      SliderRow { row in
         row.title = "🔀    " + self.l10n.AudioSpeedSection.ChangingText.Title.string
         row.value = Float(self.viewModel.recitationSpeedFactor)
         row.displayValueFor = { String(format: "%.2f", $0!) }
         row.cell.slider.minimumValue = 0.5
         row.cell.slider.maximumValue = 2.0
         row.steps = UInt((row.cell.slider.maximumValue - row.cell.slider.minimumValue) / 0.05)
         row.hidden = Condition.function([self.audioModeRowTag]) { _ in
            self.audioMode != .movementSound && self.audioMode != AudioMode.none
         }
      }
      .onChange { row in
         guard let rowValue = row.value else {
            log.error("Changing text speed had nil value.")
            return
         }
         self.flowDelegate?.setChangingPartSpeed(Double(rowValue))
      }
   }

   private func changingTextNameRow() -> SwitchRow {
      SwitchRow { row in
         row.title = self.l10n.PrayerSection.ChangingTextName.Title.string
         row.value = self.viewModel.showRecitationName
      }
      .cellSetup { cell, _ in
         cell.imageView?.image = UIImage(systemName: "character.book.closed")
      }
      .onChange { row in
         guard let rowValue = row.value else {
            log.error("Show changing text name had nil value.")
            return
         }
         self.flowDelegate?.setShowChangingTextName(rowValue)
      }
   }

   private func allowLongerRecitationsRow() -> SwitchRow {
      SwitchRow { row in
         row.title = self.l10n.PrayerSection.AllowLongerRecitations.Title.string
         row.value = self.viewModel.allowLongerRecitations
      }
      .cellSetup { cell, _ in
         cell.imageView?.image = UIImage(systemName: "clock.badge.checkmark")
      }
      .onChange { row in
         guard let rowValue = row.value else {
            log.error("Allow longer recitations had nil value.")
            return
         }

         if self.viewModel.allowLongerRecitations != rowValue, Defaults.nextRecitationPart != nil {
            // delete next recitation part since part calculation changes with this setting adjusted
            Defaults.nextRecitationPart = nil

            // inform user about the reset of the current ongoing recitation
            self.showToast(message: self.l10n.PrayerSection.AllowLongerRecitations.ResetMessage.string)
         }

         self.flowDelegate?.setAllowLongerRecitations(rowValue)
      }
   }

   private func allowSplittingRecitationsRow() -> SwitchRow {
      SwitchRow { row in
         row.title = self.l10n.PrayerSection.AllowSplittingRecitations.Title.string
         row.value = self.viewModel.allowSplittingRecitations
      }
      .cellSetup { cell, _ in
         cell.imageView?.image = UIImage(systemName: "scissors")
      }
      .onChange { row in
         guard let rowValue = row.value else {
            log.error("Allow splitting recitations had nil value.")
            return
         }
         self.flowDelegate?.setAllowSplittingRecitations(rowValue)
      }
   }

   private func movementSoundInstrumentRow() -> PushRow<String> {
      PushRow<String> { row in
         row.title = self.l10n.AudioSpeedSection.MovementSoundInstrument.Title.string
         row.options = SoundInstrument.allCases.map(\.rawValue)
         row.value = self.viewModel.movementSoundInstrument
         row.hidden = Condition.function([self.audioModeRowTag]) { _ in
            self.audioMode != .movementSound && self.audioMode != .movementSoundAndSpeechSynthesizer
         }
      }
      .cellSetup { cell, _ in
         cell.imageView?.image = UIImage(systemName: "guitars")
      }
      .onChange { row in
         guard let rowValue = row.value else {
            log.error("Instrument had nil value.")
            return
         }
         self.flowDelegate?.chooseInstrument(rowValue)
      }
   }

   private func speechSynthesizerVoiceRow() -> PushRow<AVSpeechSynthesisVoice> {
      PushRow<AVSpeechSynthesisVoice> { row in
         row.title = self.l10n.Audio.SpeechSynthesizer.Voice.string
         row.options = SpeechSynthesizer.SupportedLanguage.current.voices
         row.value = self.viewModel.speechSynthesizerVoice
         row.displayValueFor = { $0 != nil ? "\($0!.name) (\($0!.language))" : nil }
         row.hidden = Condition.function([self.audioModeRowTag]) { _ in
            self.audioMode != .speechSynthesizer && self.audioMode != .movementSoundAndSpeechSynthesizer
         }
      }
      .cellSetup { cell, _ in
         cell.imageView?.image = UIImage(systemName: "person.wave.2")
      }
      .onChange { row in
         guard let rowValue = row.value else {
            log.error("Synthesizer voice had nil value.")
            return
         }
         self.flowDelegate?.setSpeechSynthesizerVoice(rowValue)
      }
      .onPresent { from, to in
         to.selectableRowCellUpdate = { cell, row in
            cell.textLabel?.text = row.selectableValue!.name
            cell.detailTextLabel?.text = Locale.current.localizedString(forIdentifier: row.selectableValue!.language)
         }
      }
   }

   private func speechSynthesizerPitchMultiplierRow() -> SliderRow {
      SliderRow { row in
         row.title = "↕️   " + self.l10n.Audio.SpeechSynthesizer.PitchMultiplier.string
         row.value = self.viewModel.speechSynthesizerPitchMultiplier
         row.displayValueFor = { String(format: "%.2f", $0!) }
         row.cell.slider.minimumValue = 0.5
         row.cell.slider.maximumValue = 2.0
         row.steps = UInt((row.cell.slider.maximumValue - row.cell.slider.minimumValue) / 0.05)
         row.hidden = Condition.function([self.audioModeRowTag]) { _ in
            self.audioMode != .speechSynthesizer && self.audioMode != .movementSoundAndSpeechSynthesizer
         }
      }
      .onChange { row in
         guard let rowValue = row.value else {
            log.error("Pitch multiplier had nil value.")
            return
         }
         self.flowDelegate?.setSpeechSynthesizerPitchMultiplier(rowValue)
      }
   }

   private func speechSynthesizerSpeechRateRow() -> SliderRow {
      SliderRow { row in
         row.title = "🐇   " + self.l10n.Audio.SpeechSynthesizer.SpeechRate.string
         row.value = self.viewModel.speechSynthesizerSpeechRate
         row.displayValueFor = { String(format: "%.2f", $0!) }
         row.cell.slider.minimumValue = (AVSpeechUtteranceMinimumSpeechRate + AVSpeechUtteranceDefaultSpeechRate) / 2
         row.cell.slider.maximumValue = (AVSpeechUtteranceMaximumSpeechRate + AVSpeechUtteranceDefaultSpeechRate) / 2
         row.steps = UInt((row.cell.slider.maximumValue - row.cell.slider.minimumValue) / 0.01)
         row.hidden = Condition.function([self.audioModeRowTag]) { _ in
            self.audioMode != .speechSynthesizer && self.audioMode != .movementSoundAndSpeechSynthesizer
         }
      }
      .onChange { row in
         guard let rowValue = row.value else {
            log.error("Speech rate had nil value.")
            return
         }
         self.flowDelegate?.setSpeechSynthesizerSpeechRate(rowValue)
      }
   }

   private func volumeViewRow() -> ViewRow<AudioVolumeView> {
      ViewRow<AudioVolumeView> { row in
         row.title = "🔈   " + self.l10n.Audio.OutputDevice.Title.string
         row.hidden = Condition.function([self.audioModeRowTag]) { _ in
            self.audioMode == nil || self.audioMode == AudioMode.none
         }
      }
      .cellSetup { cell, _ in
         let horizontalMargin: CGFloat = 20
         let verticalMargin: CGFloat = 10
         let volumeSliderHeight: CGFloat = 18

         cell.view = AudioVolumeView(
            frame: CGRect(
               width: UIScreen.main.bounds.width - 2 * horizontalMargin,
               height: volumeSliderHeight + 2 * verticalMargin
            )
         )

         cell.titleLeftMargin = horizontalMargin
         cell.titleRightMargin = horizontalMargin

         cell.viewLeftMargin = horizontalMargin
         cell.viewRightMargin = horizontalMargin
         cell.viewBottomMargin = 5
      }
   }

   private func setupStartSection() {
      let startSection =
         Section()
         <<< ButtonRow { row in
            row.title = "🕋   " + L10n.Settings.StartButton.Title.string
         }
         .cellSetup { cell, _ in
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
         }
         .onCellSelection { _, _ in
            self.flowDelegate?.startPrayer()
         }

      form.append(startSection)
   }

   private func setupFAQButton() {
      navigationItem.leftBarButtonItem = UIBarButtonItem(
         title: self.l10n.FaqButton.Title.string,
         style: .plain,
         target: self,
         action: #selector(self.didPressFAQButton)
      )
   }

   private func setupFeedbackButton() {
      navigationItem.rightBarButtonItem = UIBarButtonItem(
         title: self.l10n.FeedbackButton.Title.string,
         style: .plain,
         target: self,
         action: #selector(self.didPressFeedbackButton)
      )
   }

   @objc
   func didPressFAQButton() {
      self.flowDelegate?.didPressFAQButton()
   }

   @objc
   func didPressFeedbackButton() {
      self.flowDelegate?.didPressFeedbackButton()
   }
}
