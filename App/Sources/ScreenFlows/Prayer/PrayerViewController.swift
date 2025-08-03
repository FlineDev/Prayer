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

class PrayerViewController: UIViewController {
   var viewModel: PrayerViewModel! {
      didSet {
         title = self.viewModel.currentComponentName

         self.updateLineLabels()
         self.updateArrowLabels()
         self.updateSeparators()

         if self.viewModel.currentLine.contains(String.recitationEmoji) {
            self.currentLineLabel.textColor = Colors.secondary
         } else {
            self.currentLineLabel.textColor = Colors.primary
         }
      }
   }

   weak var flowDelegate: PrayerFlowDelegate?

   @IBOutlet private var previousLineLabel: UILabel!
   @IBOutlet private var currentLineLabel: UILabel!
   @IBOutlet private var nextLineLabel: UILabel!

   @IBOutlet private var previousArrowLabel: UILabel!
   @IBOutlet private var currentArrowLabel: UILabel!
   @IBOutlet private var nextArrowLabel: UILabel!

   @IBOutlet private var currentLineComponentSeparator: UIImageView!
   @IBOutlet private var nextLineComponentSeparator: UIImageView!

   override func viewDidLoad() {
      super.viewDidLoad()

      view.backgroundColor = Colors.contentBackground

      let doneSelector = #selector(self.doneButtonPressed)
      let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: doneSelector)
      navigationItem.rightBarButtonItem = doneItem
   }

   override var shouldAutorotate: Bool { false }
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
      self.flowDelegate?.doneButtonPressed()
   }

   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

      self.clearLineLabels()
      self.clearArrowLabels()
      self.clearSeparators()
   }

   private func clearLineLabels() {
      // NOTE: a whitespace is added in order to have an intrinsic size for all labels
      self.previousLineLabel.text = " "
      self.currentLineLabel.text = " "
      self.nextLineLabel.text = " "
   }

   private func clearArrowLabels() {
      self.previousArrowLabel.text = " "
      self.currentArrowLabel.text = " "
      self.nextArrowLabel.text = " "
   }

   private func clearSeparators() {
      self.currentLineComponentSeparator.isHidden = true
      self.nextLineComponentSeparator.isHidden = true
   }

   private func updateLineLabels() {
      self.previousLineLabel.text = self.viewModel.previousLine ?? " "
      self.currentLineLabel.text = self.viewModel.currentLine + " "
      self.nextLineLabel.text = self.viewModel.nextLine ?? " "
   }

   private func updateArrowLabels() {
      self.previousArrowLabel.text = (self.viewModel.previousArrow?.rawValue ?? "") + " "
      self.currentArrowLabel.text = (self.viewModel.currentArrow?.rawValue ?? "") + " "
      self.nextArrowLabel.text = (self.viewModel.nextArrow?.rawValue ?? "") + " "
   }

   private func updateSeparators() {
      if self.viewModel.previousLine != nil || self.viewModel.nextLine != nil {
         self.currentLineComponentSeparator.isHidden = !self.viewModel.currentIsComponentBeginning
         self.nextLineComponentSeparator.isHidden = !self.viewModel.nextIsComponentBeginning
      }
   }
}
