//
//  Created by Cihat Gündüz on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import Eureka
import HandyUIKit
import Imperio
import UIKit

protocol SettingsFlowDelegate: AnyObject {
  func setRakat(_ rakatCount: Int)
  func setFixedPartSpeed(_ fixedPartSpeed: Double)
  func setChangingPartSpeed(_ changingPartSpeed: Double)
  func setShowChangingTextName(_ showChangingTextName: Bool)
  func changeLanguage(to language: String)
  func confirmRestart()
  func chooseInstrument(_ instrument: String)
  func startPrayer()
  func didPressFAQButton()
  func didPressFeedbackButton()
}

class SettingsViewController: BrandedFormViewController {
  // MARK: - Stored Instance Properties
  let l10n = L10n.Settings.self
  var viewModel: SettingsViewModel

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
    tableView?.backgroundColor = Colors.Theme.contentBackground

    setupAppSection()
    setupPrayerSection()
    setupStartSection()
    setupFAQButton()
    setupFeedbackButton()
  }

  // MARK: - Instance Methods
  private func setupAppSection() {
    let appSection =
      Section(l10n.AppSection.title)
      <<< ActionSheetRow<String> { row in
        row.title = l10n.AppSection.InterfaceLanguage.title
        row.options = SettingsViewModel.availableLanguageCodes
        row.value = viewModel.interfaceLanguageCode
        row.displayValueFor = { Locale.current.localizedString(forLanguageCode: $0!) }
      }
      .onChange { row in
        guard let rowValue = row.value else { log.error("Language had nil value."); return }
        self.flowDelegate?.changeLanguage(to: rowValue)
      }

    form.append(appSection)
  }

  private func setupPrayerSection() {
    let prayerSection =
      Section(l10n.PrayerSection.title)
      <<< rakatCountRow()
      <<< fixedTextsRow()
      <<< changingTextRow()
      <<< changingTextNameRow()
      <<< movementSoundInstrumentRow()

    form.append(prayerSection)
  }

  fileprivate func rakatCountRow() -> IntRow {
    return IntRow { row in
      row.title = l10n.PrayerSection.RakatCount.title
      row.value = viewModel.rakatCount
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

  fileprivate func fixedTextsRow() -> SliderRow {
    return SliderRow { row in
      row.title = l10n.PrayerSection.FixedTexts.title
      row.value = Float(viewModel.fixedTextsSpeedFactor)
      row.cell.slider.minimumValue = 0.5
      row.cell.slider.maximumValue = 2.0
      row.steps = UInt((row.cell.slider.maximumValue - row.cell.slider.minimumValue) / 0.05)
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Fixed text speed had nil value."); return }
      self.flowDelegate?.setFixedPartSpeed(Double(rowValue))
    }
  }

  fileprivate func changingTextRow() -> SliderRow {
    return SliderRow { row in
      row.title = l10n.PrayerSection.ChangingText.title
      row.value = Float(viewModel.changingTextSpeedFactor)
      row.cell.slider.minimumValue = 0.5
      row.cell.slider.maximumValue = 2.0
      row.steps = UInt((row.cell.slider.maximumValue - row.cell.slider.minimumValue) / 0.05)
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Changing text speed had nil value."); return }
      self.flowDelegate?.setChangingPartSpeed(Double(rowValue))
    }
  }

  fileprivate func changingTextNameRow() -> SwitchRow {
    return SwitchRow { row in
      row.title = l10n.PrayerSection.ChangingTextName.title
      row.value = viewModel.showChangingTextName
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Show changing text name had nil value."); return }
      self.flowDelegate?.setShowChangingTextName(rowValue)
    }
  }

  fileprivate func movementSoundInstrumentRow() -> PushRow<String> {
    return PushRow<String> { row in
      row.title = l10n.PrayerSection.MovementSoundInstrument.title
      row.options = SettingsViewModel.availableMovementSoundInstruments
      row.value = viewModel.movementSoundInstrument
    }
    .onChange { row in
      guard let rowValue = row.value else { log.error("Instrument had nil value."); return }
      self.flowDelegate?.chooseInstrument(rowValue)
    }
  }

  private func setupStartSection() {
    let startSection =
      Section()
      <<< ButtonRow { row in
        row.title = L10n.Settings.StartButton.title
      }
      .cellSetup { cell, _ in
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
      }
      .cellUpdate { cell, _ in
        cell.textLabel?.textColor = Colors.Theme.accent
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

  func showRestartConfirmDialog() {
    let localL10n = l10n.ConfirmAlert.self

    let confirmAlertCtrl = UIAlertController(title: localL10n.title, message: localL10n.message, preferredStyle: .alert)
    let confirmAction = UIAlertAction(title: localL10n.Action.confirm, style: .destructive) { _ in
      self.flowDelegate?.confirmRestart()
    }

    confirmAlertCtrl.addAction(confirmAction)

    let laterAction = UIAlertAction(title: localL10n.Action.later, style: .cancel, handler: nil)
    confirmAlertCtrl.addAction(laterAction)

    present(confirmAlertCtrl, animated: true, completion: nil)
  }
}
