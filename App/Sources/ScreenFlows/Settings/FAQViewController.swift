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
  // MARK: - IBOutlets
  @IBOutlet private var collectionView: UICollectionView!

  // MARK: - Stored Instance Properties
  private let l10n = L10n.Settings.Faq.self
  fileprivate let cellReuseIdentifier: String = "FAQCell"

  weak var flowDelegate: FAQFlowDelegate?

  var viewModel: FAQViewModel! {
    didSet {
      if view != nil {
        collectionView.reloadData()
      }
    }
  }

  // MARK: - View Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()

    title = l10n.title
    (collectionView.collectionViewLayout as! FAQCollectionViewLayout).delegate = self
  }

  // MARK: - IBAction Methods
  @IBAction private func doneButtonPressed() {
    flowDelegate?.doneButtonPressed()
  }
}

// MARK: - UICollectionViewDataSource Protocol Implementation
extension FAQViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.entries.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell =
      collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
      as! FAQCollectionViewCell

    cell.questionLabel.font = (collectionView.collectionViewLayout as! FAQCollectionViewLayout).questionLabelFont
    cell.answerLabel.font = (collectionView.collectionViewLayout as! FAQCollectionViewLayout).answerLabelFont

    cell.questionLabel.attributedText = viewModel.entries[indexPath.item].question.hyphenated()
    cell.answerLabel.attributedText = viewModel.entries[indexPath.item].answer.hyphenated()

    return cell
  }
}

// MARK: - FAQCollectionViewLayoutDelegate Protocol Implementation
extension FAQViewController: FAQCollectionViewLayoutDelegate {
  func question(at indexPath: IndexPath) -> String {
    viewModel.entries[indexPath.item].question
  }

  func answer(at indexPath: IndexPath) -> String {
    viewModel.entries[indexPath.item].answer
  }
}
