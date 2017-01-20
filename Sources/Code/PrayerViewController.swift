//
//  PrayerViewController.swift
//  Prayer
//
//  Created by Cihat Gündüz on 17.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import HandySwift
import SwiftyTimer

class PrayerViewController: UIViewController {
    // MARK: - Stored Instance Properties

    private var salah: Salah!
    private var textSpeedFactor: Double!
    private var countDown: Int? {
        didSet {
            if let countDown = countDown {
                currentLineLabel.text = "\(countDown)"
            }
        }
    }
    private var currentTimer: Timer?
    private var currentRakahIndex = 0
    private var currentComponentIndex = 0 {
        didSet {
            title = salah.rakat[currentRakahIndex].components()[currentComponentIndex].name
        }
    }
    private var currentSpokenTextLine = 0


    // MARK: - Computed Instance Properties

    private var previousLineText: String? {
        if currentSpokenTextLine > 0 { return salah.rakat[currentRakahIndex].components()[currentComponentIndex].spokenTextLines[currentSpokenTextLine - 1] }
        if currentComponentIndex > 0 { return salah.rakat[currentRakahIndex].components()[currentComponentIndex - 1].spokenTextLines.last! }
        if currentRakahIndex > 0 { return salah.rakat[currentRakahIndex - 1].components().last!.spokenTextLines.last! }

        return nil
    }
    private var currentLineText: String? {
        return salah.rakat[currentRakahIndex].components()[currentComponentIndex].spokenTextLines[currentSpokenTextLine]
    }
    private var nextLineText: String? {
        if currentSpokenTextLine + 1 < salah.rakat[currentRakahIndex].components()[currentComponentIndex].spokenTextLines.count {
            return salah.rakat[currentRakahIndex].components()[currentComponentIndex].spokenTextLines[currentSpokenTextLine + 1]
        }
        if currentComponentIndex + 1 < salah.rakat[currentRakahIndex].components().count {
            return salah.rakat[currentRakahIndex].components()[currentComponentIndex + 1].spokenTextLines.first!
        }
        if currentRakahIndex + 1 < salah.rakat.count {
            return salah.rakat[currentRakahIndex + 1].components().first!.spokenTextLines.first!
        }
        return nil
    }


    // MARK: - IBOutlets

    @IBOutlet var previousLineLabel: UILabel!
    @IBOutlet var currentLineLabel: UILabel!
    @IBOutlet var nextLineLabel: UILabel!

    @IBOutlet var currentMovementIconView: UIImageView!
    @IBOutlet var nextMovementIconView: UIImageView!


    // MARK: - IBActions

    @IBAction func doneButtonPressed() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }


    // MARK: - Instance Methods

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        clearLabels()
        clearIcons()
    }

    deinit {
        currentTimer?.invalidate()
        currentTimer = nil
    }

    func start(salah: Salah, textSpeedFactor: Double) {
        self.salah = salah
        self.textSpeedFactor = textSpeedFactor

        clearLabels()
        nextLineLabel.text = salah.rakat.first!.components().first!.spokenTextLines.first!

        playCountDown {
            self.currentTimer?.invalidate()
            self.currentTimer = nil

            self.updateLabels()
            self.updateIcons()
            self.title = self.salah.rakat[self.currentRakahIndex].components()[self.currentComponentIndex].name
            let duration = RakahComponent.lineChangeDuration.timeInterval + self.salah.rakat[0].components().first!.spokenTextLines.first!.estimatedReadingTime
            delay(bySeconds: duration / textSpeedFactor) {
                self.progressPrayer {
                    self.presentingViewController?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }

    private func clearLabels() {
        previousLineLabel.text = nil
        currentLineLabel.text = nil
        nextLineLabel.text = nil
    }

    private func clearIcons() {
        currentMovementIconView.image = nil
        nextMovementIconView.image = nil
    }

    private func playCountDown(completion: @escaping () -> Void) {
        title = L10n.PrayerView.Countdown.name
        countDown = 5

        currentTimer = Timer.every(1.0.seconds) {
            if let countDown = self.countDown, countDown > 1 {
                self.countDown = countDown - 1
            } else {
                self.countDown = nil
                completion()
            }
        }
    }

    private func progressPrayer(completion: @escaping () -> Void) {
        if moveOnToNextLine() {
            if let currentLineText = currentLineText {
                let duration: TimeInterval = {
                    if currentSpokenTextLine == 0 && self.salah.rakat[currentRakahIndex].components()[currentComponentIndex].needsMovement {
                        return RakahComponent.lineChangeDuration.timeInterval + currentLineText.estimatedReadingTime
                    } else {
                        return currentLineText.estimatedReadingTime
                    }
                }()

                Timer.after(duration / textSpeedFactor) {
                    self.progressPrayer(completion: completion)
                }
            }
        } else {
            completion()
        }

        updateLabels()
        updateIcons()
    }

    private func updateLabels() {
        self.previousLineLabel.text = self.previousLineText
        self.currentLineLabel.text = self.currentLineText
        self.nextLineLabel.text = self.nextLineText
    }

    private func updateIcons() {
        guard currentRakahIndex != 0 || currentComponentIndex != 0 || currentSpokenTextLine != 0 else { return }

        if currentSpokenTextLine == 0 {
            currentMovementIconView.image = self.salah.rakat[currentRakahIndex].components()[currentComponentIndex].movementIcon?.withRenderingMode(.alwaysTemplate)
        } else {
            currentMovementIconView.image = nil
        }

        if currentSpokenTextLine == self.salah.rakat[currentRakahIndex].components()[currentComponentIndex].spokenTextLines.count - 1 {
            let nextComponent: RakahComponent? = {
                if currentComponentIndex + 1 < salah.rakat[currentRakahIndex].components().count {
                    return salah.rakat[currentRakahIndex].components()[currentComponentIndex + 1]
                } else if currentRakahIndex + 1 < salah.rakat.count {
                    return salah.rakat[currentRakahIndex + 1].components().first!
                } else {
                    return nil
                }
            }()

            if let nextComponent = nextComponent {
                nextMovementIconView.image = nextComponent.movementIcon?.withRenderingMode(.alwaysTemplate)
            } else {
                nextMovementIconView.image = nil
            }
        } else {
            nextMovementIconView.image = nil
        }
    }

    private func moveOnToNextLine() -> Bool {
        if currentSpokenTextLine + 1 < salah.rakat[currentRakahIndex].components()[currentComponentIndex].spokenTextLines.count {
            currentSpokenTextLine += 1
        } else if currentComponentIndex + 1 < salah.rakat[currentRakahIndex].components().count {
            currentComponentIndex += 1
            currentSpokenTextLine = 0
        } else if currentRakahIndex + 1 < salah.rakat.count {
            currentRakahIndex += 1
            currentComponentIndex = 0
            currentSpokenTextLine = 0
        } else {
            return false
        }

        return true
    }
}
