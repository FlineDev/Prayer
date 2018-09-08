//
//  Created by Cihat Gündüz on 19.02.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import HandyUIKit
import Imperio
import UIKit

enum FAQAction {
    case doneButtonPressed
}

class FAQViewController: BrandedViewController, Coordinatable {
    // MARK: - Coordinatable Protocol Implementation
    typealias Action = FAQAction
    var coordinate: ((FAQAction) -> Void)!

    // MARK: - IBOutlets
    @IBOutlet private var collectionView: UICollectionView!

    // MARK: - Stored Instance Properties
    private let l10n = L10n.Settings.Faq.self
    fileprivate let cellReuseIdentifier: String = "FAQCell"

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
        (collectionView.collectionViewLayout as! FAQCollectionViewLayout).delegate = self // swiftlint:disable:this force_cast
    }

    // MARK: - IBAction Methods
    @IBAction private func doneButtonPressed() {
        coordinate(.doneButtonPressed)
    }
}

// MARK: - UICollectionViewDataSource Protocol Implementation
extension FAQViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.entries.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // swiftlint:disable:next force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! FAQCollectionViewCell

        cell.questionLabel.font = (collectionView.collectionViewLayout as! FAQCollectionViewLayout).questionLabelFont // swiftlint:disable:this force_cast
        cell.answerLabel.font = (collectionView.collectionViewLayout as! FAQCollectionViewLayout).answerLabelFont // swiftlint:disable:this force_cast

        cell.questionLabel.attributedText = viewModel.entries[indexPath.item].question.hyphenated()
        cell.answerLabel.attributedText = viewModel.entries[indexPath.item].answer.hyphenated()

        return cell
    }
}

// MARK: - FAQCollectionViewLayoutDelegate Protocol Implementation
extension FAQViewController: FAQCollectionViewLayoutDelegate {
    func question(at indexPath: IndexPath) -> String {
        return viewModel.entries[indexPath.item].question
    }

    func answer(at indexPath: IndexPath) -> String {
        return viewModel.entries[indexPath.item].answer
    }
}
