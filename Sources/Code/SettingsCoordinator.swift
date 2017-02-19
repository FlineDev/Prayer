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

        faqViewCtrl.viewModel = FAQViewModel(entries: [
            (question: "Lorem ipsum dolor sit amet, consectetur, adipisci velit?", answer: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            (question: "Lorem ipsum dolor sit amet, consectetur, adipisc?", answer: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatuLorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in vcillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.r. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            (question: "Lorem ipsum dolor sit amet, consectetur, adipisci velitjlaksdfj lkasdjf skd?", answer: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in vcillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            (question: "Tetur, adipisci velit?", answer: "Lorem ips nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillumLorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in vcillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. doeserunt mollit anim id est laborum."),
            (question: "Lorem iptetur, adipisci velit?", answer: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed  nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            (question: "Lorem ipsum dolor sit amet, consectetur, adipisci velit?", answer: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse ciLorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in vcillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.llum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            (question: "Lorem ipsum dolor sit amet, consectetur, adipisc?", answer: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            (question: "Lorem ipsum dolor sit amet, consectetur, adipisci velitjlaksdfj lkasdjf skd?", answer: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in vcillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in vcillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            (question: "Tetur, adipisci velit?", answer: "Lorem ips nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum doeserunt mollit anim id est laborum."),
            (question: "Lorem iptetur, adipisci velit?", answer: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed  nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatLorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in vcillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.ur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            (question: "Lorem ipsum dolor sit amet, consectetur, adipisci velit?", answer: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            (question: "Lorem ipsum dolor sit amet, consectetur, adipisc?", answer: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cilluLorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in vcillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.m dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        ]) // TODO: not yet implemented

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
