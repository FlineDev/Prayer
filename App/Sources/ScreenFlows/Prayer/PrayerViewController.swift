//
//  Created by Cihat Gündüz on 17.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import HandySwift
import Imperio
import SwiftyTimer
import UIKit

protocol PrayerFlowDelegate: AnyObject {
  func doneButtonPressed()
}

class PrayerViewController: BrandedViewController {
  // MARK: - Stored Instance Properties
  var viewModel: PrayerViewModel! {
    didSet {
      title = viewModel.currentComponentName

      updateLineLabels()
      updateArrowLabels()
      updateSeparators()

      if viewModel.isChapterName {
        currentLineLabel.textColor = Colors.Theme.secondary
      }
      else {
        currentLineLabel.textColor = UIColor.black
      }

      if let movementSoundUrl = viewModel.movementSoundUrl {
        AudioPlayer.shared.playSound(at: movementSoundUrl)
      }
    }
  }

  weak var flowDelegate: PrayerFlowDelegate?

  // MARK: - IBOutlets
  @IBOutlet private var previousLineLabel: UILabel!
  @IBOutlet private var currentLineLabel: UILabel!
  @IBOutlet private var nextLineLabel: UILabel!

  @IBOutlet private var previousArrowLabel: UILabel!
  @IBOutlet private var currentArrowLabel: UILabel!
  @IBOutlet private var nextArrowLabel: UILabel!

  @IBOutlet private var currentLineComponentSeparator: UIImageView!
  @IBOutlet private var nextLineComponentSeparator: UIImageView!

  // MARK: - Instance Methods
  override func viewDidLoad() {
    super.viewDidLoad()

    let doneSelector = #selector(doneButtonPressed)
    let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: doneSelector)
    navigationItem.rightBarButtonItem = doneItem
  }

  override var shouldAutorotate: Bool { return false }
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    switch UIApplication.shared.windows.first?.windowScene?.interfaceOrientation {
    case .portrait:
      return .portrait

    case .portraitUpsideDown:
      return .portraitUpsideDown

    case .landscapeLeft:
      return .landscapeLeft

    case .landscapeRight:
      return .landscapeRight

    default:
      return .all
    }
  }

  @objc
  func doneButtonPressed() {
    flowDelegate?.doneButtonPressed()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    clearLineLabels()
    clearArrowLabels()
    clearSeparators()
  }

  private func clearLineLabels() {
    // NOTE: a whitespace is added in order to have an intrinsic size for all labels
    previousLineLabel.text = " "
    currentLineLabel.text = " "
    nextLineLabel.text = " "
  }

  private func clearArrowLabels() {
    previousArrowLabel.text = " "
    currentArrowLabel.text = " "
    nextArrowLabel.text = " "
  }

  private func clearSeparators() {
    currentLineComponentSeparator.isHidden = true
    nextLineComponentSeparator.isHidden = true
  }

  private func updateLineLabels() {
    previousLineLabel.text = viewModel.previousLine ?? " "
    currentLineLabel.text = viewModel.currentLine + " "
    nextLineLabel.text = viewModel.nextLine ?? " "
  }

  private func updateArrowLabels() {
    previousArrowLabel.text = (viewModel.previousArrow?.rawValue ?? "") + " "
    currentArrowLabel.text = (viewModel.currentArrow?.rawValue ?? "") + " "
    nextArrowLabel.text = (viewModel.nextArrow?.rawValue ?? "") + " "
  }

  private func updateSeparators() {
    if viewModel.previousLine != nil || viewModel.nextLine != nil {
      currentLineComponentSeparator.isHidden = !viewModel.currentIsComponentBeginning
      nextLineComponentSeparator.isHidden = !viewModel.nextIsComponentBeginning
    }
  }
}
