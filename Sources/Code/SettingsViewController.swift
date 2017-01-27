//
//  SettingsViewController.swift
//  Prayer
//
//  Created by Cihat Gündüz on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import Eureka
import Imperio

class SettingsViewController: BrandedFormViewController, Coordinatable {
    // MARK: - Coordinatable Protocol Implementation

    typealias Action = SettingsAction
    var coordinate: ((Action) -> Void)!


    // MARK: - Stored Instance Properties

    let l10n = L10n.Settings.self
    var viewModel: SettingsViewModel


    // MARK: - Initializers

    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel

        super.init(style: .grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - View Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("SETTINGS.TITLE", comment: "")
        tableView?.backgroundColor = Color(named: .background).change(.brightness, to: 0.95)

        let appSection = Section(l10n.AppSection.title)
            <<< ActionSheetRow<String>() { row in
                row.title = l10n.AppSection.InterfaceLanguage.title
                row.options = SettingsViewModel.availableLanguageCodes
                row.value = viewModel.interfaceLanguageCode
                row.displayValueFor = { Locale.current.localizedString(forLanguageCode: $0!) }
            }.onChange { row in
                guard let rowValue = row.value else { log.error("Language had nil value."); return }
                self.coordinate(.changeLanguage(rowValue))
            }
        form.append(appSection)

        let prayerSection = Section(l10n.PrayerSection.title)
            <<< IntRow() { row in
                row.title = l10n.PrayerSection.RakatCount.title
                row.value = viewModel.rakatCount
            }.onChange { row in
                guard let rowValue = row.value else { log.error("Rakat row had nil value."); return }
                self.coordinate(.setRakat(rowValue))
            }
            <<< SliderRow() { row in
                row.title = l10n.PrayerSection.FixedTexts.title
                row.value = Float(viewModel.fixedTextsSpeedFactor)
                row.minimumValue = 0.5
                row.maximumValue = 2.0
                row.steps = UInt((row.maximumValue - row.minimumValue) / 0.05)
            }.onChange { row in
                guard let rowValue = row.value else { log.error("Fixed text speed had nil value."); return }
                let speed = Double(rowValue)
                self.coordinate(.setFixedPartSpeed(speed))
            }
            <<< SliderRow() { row in
                row.title = l10n.PrayerSection.ChangingText.title
                row.value = Float(viewModel.changingTextSpeedFactor)
                row.minimumValue = 0.5
                row.maximumValue = 2.0
                row.steps = UInt((row.maximumValue - row.minimumValue) / 0.05)
            }.onChange { row in
                guard let rowValue = row.value else { log.error("Changing text speed had nil value."); return }
                let speed = Double(rowValue)
                self.coordinate(.setChangingPartSpeed(speed))
            }
            <<< PushRow<String>() { row in
                row.title = l10n.PrayerSection.MovementSoundInstrument.title
                row.options = SettingsViewModel.availableMovementSoundInstruments
                row.value = viewModel.movementSoundInstrument
            }.onChange { row in
                guard let rowValue = row.value else { log.error("Instrument had nil value."); return }
                self.coordinate(.chooseInstrument(rowValue))
            }
        form.append(prayerSection)

        let startSection = Section()
            <<< ButtonRow() { row in
                row.title = L10n.Settings.StartButton.title
            }.cellSetup { (cell, _) in
                cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightSemibold)
            }.cellUpdate { (cell, _) in
                cell.textLabel?.textColor = Color(named: .accent)
            }.onCellSelection { (_, _) in
                self.coordinate(.startPrayer)
            }
        form.append(startSection)
    }


    // MARK: - Instance Methods

    func showRestartConfirmDialog() {
        let l10n = self.l10n.ConfirmAlert.self

        let confirmAlertCtrl = UIAlertController(title: l10n.title, message: l10n.message, preferredStyle: .alert)

        let confirmAction = UIAlertAction(title: l10n.Action.confirm, style: .destructive) { _ in
            self.coordinate(.confirmRestart)
        }
        confirmAlertCtrl.addAction(confirmAction)

        let laterAction = UIAlertAction(title: l10n.Action.later, style: .cancel, handler: nil)
        confirmAlertCtrl.addAction(laterAction)

        present(confirmAlertCtrl, animated: true, completion: nil)
    }
}
