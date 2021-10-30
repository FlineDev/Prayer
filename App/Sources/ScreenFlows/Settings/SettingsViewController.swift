//
//  Created by Cihat Gündüz on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import AVKit
import Eureka
import HandyUIKit
import HandySwift
import Imperio
import UIKit
import SwiftyUserDefaults

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
  // MARK: - Stored Instance Properties
  let l10n = L10n.Settings.self
  var viewModel: SettingsViewModel

  private let audioModeRowTag: String = "AudioMode"

  weak var flowDelegate: SettingsFlowDelegate?

  // MARK: - Initializers
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

  // MARK: - View Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()

    title = L10n.Settings.title

    setupAppSection()
    setupPrayerSection()
    setupAudioAndSpeedSection()
    setupStartSection()
    setupFAQButton()
    setupFeedbackButton()
  }

  // MARK: - Instance Methods
  private func setupAppSection() {
    let appSection =
      Section(header: l10n.AppSection.title, footer: l10n.AppSection.footer)
      <<< ButtonRow { row in
        row.title = l10n.AppSection.ChangeLanguageButton.title
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
      Section(header: l10n.PrayerSection.title, footer: l10n.PrayerSection.footer)
      <<< rakatCountRow()
      <<< changingTextNameRow()
      <<< allowLongerRecitationsRow()
      <<< allowSplittingRecitationsRow()

    form.append(prayerSection)
  }

  private func setupAudioAndSpeedSection() {
    let audioAndSpeedSection =
      Section(header: l10n.AudioSpeedSection.title, footer: l10n.AudioSpeedSection.footer)
      <<< audioModeRow()
      <<< fixedTextSpeedRow()
      <<< changingTextSpeedRow()
      <<< movementSoundInstrumentRow()
      <<< speechSynthesizerVoiceRow()
      <<< speechSynthesizerSpeechRateRow()
      <<< speechSynthesizerPitchMultiplierRow()

    form.append(audioAndSpeedSection)
  }

  private func audioModeRow() -> SegmentedRow<AudioMode> {
    SegmentedRow<AudioMode>(audioModeRowTag) { row in
      if UIDevice.current.userInterfaceIdiom != .phone {
        row.title = l10n.AudioSpeedSection.AudioMode.title
      }
      row.options = AudioMode.allCases
      row.value = viewModel.audioMode
      row.displayValueFor = { $0?.displayDescription }
    }
    .cellSetup { cell, _ in
      cell.imageView?.image = UIImage(systemName: "waveform")
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Audio mode row had nil value."); return }
      self.flowDelegate?.setAudioMode(rowValue)
    }
  }

  private func rakatCountRow() -> IntRow {
    IntRow { row in
      row.title = l10n.PrayerSection.RakatCount.title
      row.value = viewModel.rakatCount
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
      guard let rowValue = row.value else { log.error("Rakat row had nil value."); return }
      self.flowDelegate?.setRakat(rowValue)
    }
  }

  private func fixedTextSpeedRow() -> SliderRow {
    SliderRow { row in
      row.title = "🔂    " + l10n.AudioSpeedSection.FixedTexts.title
      row.value = Float(viewModel.fixedTextsSpeedFactor)
      row.displayValueFor = { String(format: "%.2f", $0!) }
      row.cell.slider.minimumValue = 0.5
      row.cell.slider.maximumValue = 2.0
      row.steps = UInt((row.cell.slider.maximumValue - row.cell.slider.minimumValue) / 0.05)
      row.hidden = Condition.function([audioModeRowTag]) { form in
        let audioModeRow = form.rowBy(tag: self.audioModeRowTag) as! SegmentedRow<AudioMode>
        return audioModeRow.value != AudioMode.movementSound
      }
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Fixed text speed had nil value."); return }
      self.flowDelegate?.setFixedPartSpeed(Double(rowValue))
    }
  }

  private func changingTextSpeedRow() -> SliderRow {
    SliderRow { row in
      row.title = "🔀    " + l10n.AudioSpeedSection.ChangingText.title
      row.value = Float(viewModel.changingTextSpeedFactor)
      row.displayValueFor = { String(format: "%.2f", $0!) }
      row.cell.slider.minimumValue = 0.5
      row.cell.slider.maximumValue = 2.0
      row.steps = UInt((row.cell.slider.maximumValue - row.cell.slider.minimumValue) / 0.05)
      row.hidden = Condition.function([audioModeRowTag]) { form in
        let audioModeRow = form.rowBy(tag: self.audioModeRowTag) as! SegmentedRow<AudioMode>
        return audioModeRow.value != AudioMode.movementSound
      }
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Changing text speed had nil value."); return }
      self.flowDelegate?.setChangingPartSpeed(Double(rowValue))
    }
  }

  private func changingTextNameRow() -> SwitchRow {
    SwitchRow { row in
      row.title = l10n.PrayerSection.ChangingTextName.title
      row.value = viewModel.showChangingTextName
    }
    .cellSetup { cell, _ in
      cell.imageView?.image = UIImage(systemName: "character.book.closed")
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Show changing text name had nil value."); return }
      self.flowDelegate?.setShowChangingTextName(rowValue)
    }
  }

  private func allowLongerRecitationsRow() -> SwitchRow {
    SwitchRow { row in
      row.title = l10n.PrayerSection.AllowLongerRecitations.title
      row.value = viewModel.allowLongerRecitations
    }
    .cellSetup { cell, _ in
      cell.imageView?.image = UIImage(systemName: "clock.badge.checkmark")
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Allow longer recitations had nil value."); return }

      if self.viewModel.allowLongerRecitations != rowValue, Defaults.nextRecitationPart != nil {
        // delete next recitation part since part calculation changes with this setting adjusted
        Defaults.nextRecitationPart = nil

        // inform user about the reset of the current ongoing recitation
        self.showToast(message: self.l10n.PrayerSection.AllowLongerRecitations.resetMessage)
      }

      self.flowDelegate?.setAllowLongerRecitations(rowValue)
    }
  }

  private func allowSplittingRecitationsRow() -> SwitchRow {
    SwitchRow { row in
      row.title = l10n.PrayerSection.AllowSplittingRecitations.title
      row.value = viewModel.allowSplittingRecitations
    }
    .cellSetup { cell, _ in
      cell.imageView?.image = UIImage(systemName: "scissors")
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Allow splitting recitations had nil value."); return }
      self.flowDelegate?.setAllowSplittingRecitations(rowValue)
    }
  }

  private func movementSoundInstrumentRow() -> PushRow<String> {
    PushRow<String> { row in
      row.title = l10n.AudioSpeedSection.MovementSoundInstrument.title
      row.options = SettingsViewModel.availableMovementSoundInstruments
      row.value = viewModel.movementSoundInstrument
      row.hidden = Condition.function([audioModeRowTag]) { form in
        let audioModeRow = form.rowBy(tag: self.audioModeRowTag) as! SegmentedRow<AudioMode>
        return audioModeRow.value != AudioMode.movementSound
      }
    }
    .cellSetup { cell, _ in
      cell.imageView?.image = UIImage(systemName: "guitars")
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Instrument had nil value."); return }
      self.flowDelegate?.chooseInstrument(rowValue)
    }
  }

  private func speechSynthesizerVoiceRow() -> PushRow<AVSpeechSynthesisVoice> {
    PushRow<AVSpeechSynthesisVoice> { row in
      row.title = l10n.Audio.SpeechSynthesizer.voice
      row.options = SpeechSynthesizer.SupportedLanguage.current.voices
      row.value = viewModel.speechSynthesizerVoice
      row.displayValueFor = { $0 != nil ? "\($0!.name) (\($0!.language))" : nil }
      row.hidden = Condition.function([audioModeRowTag]) { form in
        let audioModeRow = form.rowBy(tag: self.audioModeRowTag) as! SegmentedRow<AudioMode>
        return audioModeRow.value != AudioMode.speechSynthesizer
      }
    }
    .cellSetup { cell, _ in
      cell.imageView?.image = UIImage(systemName: "person.wave.2")
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Synthesizer voice had nil value."); return }
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
      row.title = "↕️   " + l10n.Audio.SpeechSynthesizer.pitchMultiplier
      row.value = viewModel.speechSynthesizerPitchMultiplier
      row.displayValueFor = { String(format: "%.2f", $0!) }
      row.cell.slider.minimumValue = 0.5
      row.cell.slider.maximumValue = 2.0
      row.steps = UInt((row.cell.slider.maximumValue - row.cell.slider.minimumValue) / 0.05)
      row.hidden = Condition.function([audioModeRowTag]) { form in
        let audioModeRow = form.rowBy(tag: self.audioModeRowTag) as! SegmentedRow<AudioMode>
        return audioModeRow.value != AudioMode.speechSynthesizer
      }
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Pitch multiplier had nil value."); return }
      self.flowDelegate?.setSpeechSynthesizerPitchMultiplier(rowValue)
    }
  }

  private func speechSynthesizerSpeechRateRow() -> SliderRow {
    SliderRow { row in
      row.title = "🐇   " + l10n.Audio.SpeechSynthesizer.speechRate
      row.value = viewModel.speechSynthesizerSpeechRate
      row.displayValueFor = { String(format: "%.2f", $0!) }
      row.cell.slider.minimumValue = (AVSpeechUtteranceMinimumSpeechRate + AVSpeechUtteranceDefaultSpeechRate) / 2
      row.cell.slider.maximumValue = (AVSpeechUtteranceMaximumSpeechRate + AVSpeechUtteranceDefaultSpeechRate) / 2
      row.steps = UInt((row.cell.slider.maximumValue - row.cell.slider.minimumValue) / 0.01)
      row.hidden = Condition.function([audioModeRowTag]) { form in
        let audioModeRow = form.rowBy(tag: self.audioModeRowTag) as! SegmentedRow<AudioMode>
        return audioModeRow.value != AudioMode.speechSynthesizer
      }
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Speech rate had nil value."); return }
      self.flowDelegate?.setSpeechSynthesizerSpeechRate(rowValue)
    }
  }

  private func setupStartSection() {
    let startSection =
      Section()
      <<< ButtonRow { row in
        row.title = "🕋   " + L10n.Settings.StartButton.title
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
      title: l10n.FaqButton.title,
      style: .plain,
      target: self,
      action: #selector(didPressFAQButton)
    )
  }

  private func setupFeedbackButton() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: l10n.FeedbackButton.title,
      style: .plain,
      target: self,
      action: #selector(didPressFeedbackButton)
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
