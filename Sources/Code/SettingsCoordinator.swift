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
            showChangingTextName: settingsViewModel.showChangingTextName,
            movementSoundInstrument: settingsViewModel.movementSoundInstrument
        )

        start(subCoordinator: prayerCoordinator).onFinish {
            // no-op
        }
    }
}
