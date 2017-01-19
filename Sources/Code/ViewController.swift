//
//  ViewController.swift
//  Prayer
//
//  Created by Cihat Gündüz (Privat) on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var rakatCountInputField: UITextField!


    // MARK: - IBActions

    @IBAction func didPressStartButton() {
        guard let text = rakatCountInputField.text, let rakatCount = UInt(text) else { return }

        let prayerViewCtrl = StoryboardScene.Prayer.initialViewController()
        let navCtrl = UINavigationController(rootViewController: prayerViewCtrl)
        present(navCtrl, animated: true) {
            let salah = Salah(rakatCount: rakatCount)
            prayerViewCtrl.startSalah(salah)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        self.view.endEditing(false)
    }
}

