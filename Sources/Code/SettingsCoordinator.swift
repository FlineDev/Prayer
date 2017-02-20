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

extension DefaultsKeys {
    static let faqClosed = DefaultsKey<Bool>("faqClosed")
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

        settingsViewCtrl?.coordinate = { [unowned self] action in
            switch action {
            case .setRakat(let rakatCount):
                self.settingsViewModel.rakatCount = rakatCount
            case .setFixedPartSpeed(let fixedPartSpeed):
                self.settingsViewModel.fixedTextsSpeedFactor = fixedPartSpeed
            case .setChangingPartSpeed(let changingPartSpeed):
                self.settingsViewModel.changingTextSpeedFactor = changingPartSpeed
            case .setShowChagingTextName(let showName):
                self.settingsViewModel.showChangingTextName = showName
            case .changeLanguage(let langCode):
                self.settingsViewModel.interfaceLanguageCode = langCode
                self.settingsViewCtrl.showRestartConfirmDialog()
            case .confirmRestart:
                exit(EXIT_SUCCESS) // see http://stackoverflow.com/a/9939963/3451975
            case .chooseInstrument(let instrument):
                self.settingsViewModel.movementSoundInstrument = instrument
                if let moveSoundUrl = AudioPlayer.shared.movementSoundUrl(name: "E-Short", instrument: instrument) {
                    AudioPlayer.shared.playSound(at: moveSoundUrl)
                }
            case .startPrayer:
                self.startPrayer()
            case .didPressFAQButton:
                self.showFAQ()
            }
        }

        let navCtrl = BrandedNavigationController(rootViewController: settingsViewCtrl)
        present(initialViewController: navCtrl)

        if !Defaults[.faqClosed] {
            showFAQ()
        }
    }


    // MARK: - Action Methods

    func startPrayer() {
        let salah = Salah(rakatCount: UInt(settingsViewModel.rakatCount))

        let prayerCoordinator = PrayerCoordinator(
            presentingViewController: settingsViewCtrl,
            salah: salah,
            fixedTextSpeedsFactor: settingsViewModel.fixedTextsSpeedFactor,
            changingTextSpeedFactor: settingsViewModel.changingTextSpeedFactor,
            showChangingTextName: settingsViewModel.showChangingTextName,
            movementSoundInstrument: settingsViewModel.movementSoundInstrument
        )

        start(subCoordinator: prayerCoordinator).onFinish {
            // no-op
        }
    }

    func showFAQ() {
        let faqNavCtrl = StoryboardScene.Settings.instantiateFaqNavigationController()
        let faqViewCtrl = faqNavCtrl.topViewController as! FAQViewController
        let l10n = L10n.Settings.FaqEntries.self

        faqViewCtrl.viewModel = FAQViewModel(entries: [
            (question: l10n.AppMotivation.question, answer: l10n.AppMotivation.answer),
            (question: l10n.IpadReading.question, answer: l10n.IpadReading.answer),
            (question: l10n.Language.question, answer: l10n.Language.answer),
            (question: l10n.LanguageMix.question, answer: l10n.LanguageMix.answer),
            (question: l10n.TranslationProblem.question, answer: l10n.TranslationProblem.answer)
        ])

        faqViewCtrl.coordinate = { action in
            switch action {
            case .doneButtonPressed:
                Defaults[.faqClosed] = true
                faqViewCtrl.dismiss(animated: true, completion: nil)
            }
        }

        settingsViewCtrl.present(faqNavCtrl, animated: true, completion: nil)
    }
}
