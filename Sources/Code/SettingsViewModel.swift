//
//  SettingsViewModel.swift
//  Prayer
//
//  Created by Cihat Gündüz on 25.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

extension DefaultsKeys {
    static let rakatCount = DefaultsKey<Int?>("RakatCount")
    static let fixedTextsSpeedFactor = DefaultsKey<Double?>("FixedTextsSpeedFactor")
    static let changingTextSpeedFactor = DefaultsKey<Double?>("ChangingTextSpeedFactor")
    static let interfaceLanguageCode = DefaultsKey<[String]?>("AppleLanguages") // see http://stackoverflow.com/a/9939963/3451975
    static let movementSoundInstrument = DefaultsKey<String?>("MovementSoundInstrument")
}

class SettingsViewModel {
    // MARK: - Stored Instance Properties

    static let availableMovementSoundInstruments = [
        "Baroque Organ", "Bleep City", "Erhu", "Flow Motion", "Grand Piano with Pad & Choir", "Infinite Space",
        "Persian Santoor", "Soft Waves", "Turkish Saz Zither", "Tweed Picked Synth"
    ]

    static let availableLanguageCodes = Bundle.main.localizations.filter({ $0 != "Base" })


    // MARK: - Computed Instance Properties

    var rakatCount: Int {
        get { guard let intValue = Defaults[.rakatCount] else { return 4 }; return intValue }
        set { Defaults[.rakatCount] = newValue }
    }

    var fixedTextsSpeedFactor: Double {
        get { guard let doubleValue = Defaults[.fixedTextsSpeedFactor] else { return 1.0 }; return doubleValue }
        set { Defaults[.fixedTextsSpeedFactor] = newValue }
    }

    var changingTextSpeedFactor: Double {
        get { guard let doubleValue = Defaults[.changingTextSpeedFactor] else { return 1.0 }; return doubleValue }
        set { Defaults[.changingTextSpeedFactor] = newValue }
    }

    private var currentLangCode: String { return Bundle.main.preferredLocalizations.first! }

    var interfaceLanguageCode: String {
        get { guard let langCode = Defaults[.interfaceLanguageCode]?.first else { return currentLangCode }; return langCode }
        set { Defaults[.interfaceLanguageCode] = [newValue]; Defaults.synchronize() }
    }

    private var defaultInstrument: String { return SettingsViewModel.availableMovementSoundInstruments.first! }

    var movementSoundInstrument: String {
        get { guard let instrument = Defaults[.movementSoundInstrument] else { return defaultInstrument }; return instrument }
        set { Defaults[.movementSoundInstrument] = newValue }
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
