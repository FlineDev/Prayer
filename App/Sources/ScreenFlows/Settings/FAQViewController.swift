//
//  Created by Cihat Gündüz on 19.02.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import HandyUIKit
import Imperio
import UIKit

protocol FAQFlowDelegate: AnyObject {
   func doneButtonPressed()
}

class FAQViewController: UIViewController {
   @IBOutlet private var collectionView: UICollectionView!

   private let l10n = L10n.Settings.Faq.self
   fileprivate let cellReuseIdentifier: String = "FAQCell"

   weak var flowDelegate: FAQFlowDelegate?

   var viewModel: FAQViewModel! {
      didSet {
         if view != nil {
            self.collectionView.reloadData()
         }
      }
   }

   override func viewDidLoad() {
      super.viewDidLoad()

      title = self.l10n.Title.string
      (self.collectionView.collectionViewLayout as! FAQCollectionViewLayout).delegate = self
   }

   @IBAction private func doneButtonPressed() {
      self.flowDelegate?.doneButtonPressed()
   }
}

extension FAQViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      self.viewModel.entries.count
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell =
         collectionView.dequeueReusableCell(withReuseIdentifier: self.cellReuseIdentifier, for: indexPath)
         as! FAQCollectionViewCell

      cell.questionLabel.font = (collectionView.collectionViewLayout as! FAQCollectionViewLayout).questionLabelFont
      cell.answerLabel.font = (collectionView.collectionViewLayout as! FAQCollectionViewLayout).answerLabelFont

      cell.questionLabel.attributedText = self.viewModel.entries[indexPath.item].question.hyphenated()
      cell.answerLabel.attributedText = self.viewModel.entries[indexPath.item].answer.hyphenated()

      return cell
   }
}

extension FAQViewController: FAQCollectionViewLayoutDelegate {
   func question(at indexPath: IndexPath) -> String {
      self.viewModel.entries[indexPath.item].question
   }

   func answer(at indexPath: IndexPath) -> String {
      self.viewModel.entries[indexPath.item].answer
   }
}
