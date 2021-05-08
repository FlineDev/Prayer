//
//  Created by Cihat Gündüz on 19.02.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import HandyUIKit
import UIKit

protocol FAQCollectionViewLayoutDelegate: AnyObject {
  func question(at indexPath: IndexPath) -> String
  func answer(at indexPath: IndexPath) -> String
}

@IBDesignable
class FAQCollectionViewLayout: UICollectionViewLayout {
  // MARK: - Stored Instance Properties
  var questionLabelFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
  var answerLabelFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)

  private var cachedLayoutAttributes: [UICollectionViewLayoutAttributes] = []
  private var contentHeight: CGFloat = 0

  // MARK: - IBOutlets
  weak var delegate: FAQCollectionViewLayoutDelegate?

  // MARK: - Computed Instance Properties
  var columns: Int {
    var columns = Int(collectionView!.bounds.size.width) / preferredItemWidth
    if Int(collectionView!.bounds.size.width) % preferredItemWidth > preferredItemWidth / 2 {
      columns += 1  // round up
    }

    return columns
  }

  var itemWidth: CGFloat {
    let columns = self.columns
    let allGapsWidth = CGFloat(columns + 1) * gapWidth

    return (collectionView!.bounds.size.width - allGapsWidth) / CGFloat(columns)
  }

  // MARK: - IBInspectables
  @IBInspectable var preferredItemWidth: Int = 400
  @IBInspectable var gapWidth: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 30 : 12

  // MARK: - Instance Methods
  override func prepare() {
    guard let collectionView = collectionView else {
      log.info("Skipping FAQ layout preparation."); return
    }

    let itemWidth = self.itemWidth
    let columns = self.columns

    let xOffsets: [CGFloat] = (0..<columns).map { CGFloat($0) * (CGFloat(itemWidth) + gapWidth) + gapWidth }
    var yOffsets = [CGFloat](repeating: gapWidth, count: columns)
    var column: Int = 0
    contentHeight = 0

    for item in 0..<collectionView.numberOfItems(inSection: 0) {
      let indexPath = IndexPath(item: item, section: 0)

      let questionHeight = delegate?.question(at: indexPath).hyphenated()
        .height(forFixedWidth: itemWidth, font: questionLabelFont)
      let answerHeight = delegate?.answer(at: indexPath).hyphenated()
        .height(forFixedWidth: itemWidth, font: answerLabelFont)
      let verticalGaps = gapWidth / 4

      let height = questionHeight! + answerHeight! + verticalGaps

      let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
      attributes.frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: itemWidth, height: height)
      cachedLayoutAttributes.append(attributes)

      contentHeight = max(contentHeight, attributes.frame.maxY + gapWidth)
      yOffsets[column] += height + gapWidth

      column = yOffsets.firstIndex(of: yOffsets.min()!)!
    }
  }

  override var collectionViewContentSize: CGSize {
    return CGSize(width: collectionView!.bounds.size.width, height: contentHeight)
  }

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    return cachedLayoutAttributes.filter { $0.frame.intersects(rect) }
  }

  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    return cachedLayoutAttributes[indexPath.item]
  }

  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true  // ensure to re-calculate layout on orientation change
  }
}
