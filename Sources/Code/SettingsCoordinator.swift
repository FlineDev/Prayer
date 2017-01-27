//
//  SettingsCoordinator.swift
//  Prayer
//
//  Created by Cihat Gündüz on 23.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import Imperio
import SwiftyUserDefaults

enum SettingsAction {
    case setRakat(Int)
    case setFixedPartSpeed(Double)
    case setChangingPartSpeed(Double)
    case setShowChagingTextName(Bool)
    case changeLanguage(String)
    case confirmRestart
    case chooseInstrument(String)
    case startPrayer
}

class SettingsCoordinator: AppCoordinator {
    // MARK: - Stored Instance Properties

    var settingsViewModel: SettingsViewModel!
    var settingsViewCtrl: SettingsViewController!


    // MARK: - Computed Instance Properties

    override var mainViewController: UIViewController? {
        return settingsViewCtrl
    }


    // MARK: - Coordinator Methods

    override func start() {
        super.start()

        settingsViewModel = SettingsViewModel()
        settingsViewCtrl = SettingsViewController(viewModel: settingsViewModel)

        weak var weakSelf = self
        settingsViewCtrl?.coordinate = { action in
            switch action {
            case .setRakat(let rakatCount):
                weakSelf?.settingsViewModel.rakatCount = rakatCount
            case .setFixedPartSpeed(let fixedPartSpeed):
                weakSelf?.settingsViewModel.fixedTextsSpeedFactor = fixedPartSpeed
            case .setChangingPartSpeed(let changingPartSpeed):
                weakSelf?.settingsViewModel.changingTextSpeedFactor = changingPartSpeed
            case .setShowChagingTextName(let showName):
                weakSelf?.settingsViewModel.showChangingTextName = showName
            case .changeLanguage(let langCode):
                weakSelf?.settingsViewModel.interfaceLanguageCode = langCode
                weakSelf?.settingsViewCtrl.showRestartConfirmDialog()
            case .confirmRestart:
                exit(EXIT_SUCCESS) // see http://stackoverflow.com/a/9939963/3451975
            case .chooseInstrument(let instrument):
                weakSelf?.settingsViewModel.movementSoundInstrument = instrument
                if let moveSoundUrl = AudioPlayer.shared.movementSoundUrl(name: "E-Short", instrument: instrument) {
                    AudioPlayer.shared.playSound(at: moveSoundUrl)
                }
            case .startPrayer:
                weakSelf?.startPrayer()
            }
        }

        let navCtrl = BrandedNavigationController(rootViewController: settingsViewCtrl)
        present(initialViewController: navCtrl)
    }


    // MARK: - Action Methods

    func startPrayer() {
        let salah = Salah(rakatCount: UInt(settingsViewModel.rakatCount))

        let prayerCoordinator = PrayerCoordinator(
            presentingViewController: settingsViewCtrl,
            salah: salah,
            fixedTextSpeedsFactor: settingsViewModel.fixedTextsSpeedFactor,
            changingTextSpeedFactor: settingsViewModel.changingTextSpeedFactor,
            movementSoundInstrument: settingsViewModel.movementSoundInstrument
        )

        start(subCoordinator: prayerCoordinator).onFinish {
            // no-op
        }
    }
}


//    // MARK: - IBActions
//
//    @IBAction func didPressStartButton() {
//        guard let text = rakatCountInputField.text, let rakatCount = UInt(text) else { return }
//
//        let prayerViewCtrl = StoryboardScene.Prayer.initialViewController()
//        let navCtrl = UINavigationController(rootViewController: prayerViewCtrl)
//        present(navCtrl, animated: true) {
//            let salah = Salah(rakatCount: rakatCount)
//            let textSpeedFactor: Double = 1.0 + Double(self.textSpeedSegmentedControl.selectedSegmentIndex - 1) * 0.33
//            prayerViewCtrl.start(salah: salah, textSpeedFactor: textSpeedFactor)
//        }
//    }
//
//    @IBAction func didPressChangeLanguageButton() {
//        let l10n = self.l10n.ChangeLanguageSheet.self
//
//        let sheetCtrl = UIAlertController(title: l10n.title, message: l10n.message, preferredStyle: .actionSheet)
//
//        for languageCode in Bundle.main.localizations.filter({ $0 != "Base" }) {
//
//            let action = UIAlertAction(title: Locale.current.localizedString(forLanguageCode: languageCode), style: .default) { _ in
//                self.changeToLanguage(languageCode)
//            }
//            sheetCtrl.addAction(action)
//        }
//
//        let cancelAction = UIAlertAction(title: l10n.Action.cancel, style: .cancel, handler: nil)
//        sheetCtrl.addAction(cancelAction)
//
//        sheetCtrl.popoverPresentationController?.sourceView = self.view
//        sheetCtrl.popoverPresentationController?.sourceRect = self.changeLanguageButton.frame
//        present(sheetCtrl, animated: true, completion: nil)
//    }
//
//    @IBAction func didPressMovementSoundButton() {
//        let l10n = self.l10n.ChangeLanguageSheet.self
//        let sheetCtrl = UIAlertController(title: l10n.title, message: l10n.message, preferredStyle: .actionSheet)
//
//        for instrument in RakahComponent.movementSoundInstruments {
//            let style: UIAlertActionStyle = instrument == RakahComponent.movementSoundInstrument ? .destructive : .default
//
//            let action = UIAlertAction(title: instrument, style: style) { _ in
//                self.changeMovementSound(to: instrument)
//            }
//            sheetCtrl.addAction(action)
//        }
//
//        let cancelAction = UIAlertAction(title: l10n.Action.cancel, style: .cancel, handler: nil)
//        sheetCtrl.addAction(cancelAction)
//
//        sheetCtrl.popoverPresentationController?.sourceView = self.view
//        sheetCtrl.popoverPresentationController?.sourceRect = self.movementSoundButton.frame
//        present(sheetCtrl, animated: true, completion: nil)
//    }
//
//
//    // MARK: - Stores Instance Properties
//
//    private let l10n = L10n.Settings.self
//
//
//    // MARK: - Instance Methods
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//
//        self.view.endEditing(false)
//    }
//
//    func changeToLanguage(_ langCode: String) {
//        if Bundle.main.preferredLocalizations.first != langCode {
//            let l10n = self.l10n.ConfirmAlert.self
//
//            let confirmAlertCtrl = UIAlertController(title: l10n.title, message: l10n.message, preferredStyle: .alert)
//
//            let confirmAction = UIAlertAction(title: l10n.Action.confirm, style: .destructive) { _ in
//                UserDefaults.standard.set([langCode], forKey: "AppleLanguages")
//                UserDefaults.standard.synchronize()
//                exit(EXIT_SUCCESS) // see http://stackoverflow.com/a/9939963/3451975
//            }
//            confirmAlertCtrl.addAction(confirmAction)
//
//            let cancelAction = UIAlertAction(title: l10n.Action.cancel, style: .cancel, handler: nil)
//            confirmAlertCtrl.addAction(cancelAction)
//
//            present(confirmAlertCtrl, animated: true, completion: nil)
//        }
//    }
//
//    func changeMovementSound(to instrument: String) {
//        RakahComponent.movementSoundInstrument = instrument
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        view.endEditing(false)
//        return true
//    }
