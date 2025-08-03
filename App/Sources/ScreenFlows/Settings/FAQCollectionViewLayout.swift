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
   var questionLabelFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
   var answerLabelFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)

   private var cachedLayoutAttributes: [UICollectionViewLayoutAttributes] = []
   private var contentHeight: CGFloat = 0

   weak var delegate: FAQCollectionViewLayoutDelegate?

   var columns: Int {
      var columns = Int(collectionView!.bounds.size.width) / self.preferredItemWidth
      if Int(collectionView!.bounds.size.width) % self.preferredItemWidth > self.preferredItemWidth / 2 {
         columns += 1  // round up
      }

      return columns
   }

   var itemWidth: CGFloat {
      let columns = self.columns
      let allGapsWidth = CGFloat(columns + 1) * self.gapWidth

      return (collectionView!.bounds.size.width - allGapsWidth) / CGFloat(columns)
   }

   @IBInspectable var preferredItemWidth: Int = 400
   @IBInspectable var gapWidth: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 30 : 12

   override func prepare() {
      guard let collectionView = collectionView else {
         log.info("Skipping FAQ layout preparation.")
         return
      }

      let itemWidth = self.itemWidth
      let columns = self.columns

      let xOffsets: [CGFloat] = (0..<columns).map { CGFloat($0) * (CGFloat(itemWidth) + self.gapWidth) + self.gapWidth }
      var yOffsets = [CGFloat](repeating: gapWidth, count: columns)
      var column: Int = 0
      self.contentHeight = 0

      for item in 0..<collectionView.numberOfItems(inSection: 0) {
         let indexPath = IndexPath(item: item, section: 0)

         let questionHeight = self.delegate?.question(at: indexPath).hyphenated()
            .height(forFixedWidth: itemWidth, font: self.questionLabelFont)
         let answerHeight = self.delegate?.answer(at: indexPath).hyphenated()
            .height(forFixedWidth: itemWidth, font: self.answerLabelFont)
         let verticalGaps = self.gapWidth / 4

         let height = questionHeight! + answerHeight! + verticalGaps

         let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
         attributes.frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: itemWidth, height: height)
         self.cachedLayoutAttributes.append(attributes)

         self.contentHeight = max(self.contentHeight, attributes.frame.maxY + self.gapWidth)
         yOffsets[column] += height + self.gapWidth

         column = yOffsets.firstIndex(of: yOffsets.min()!)!
      }
   }

   override var collectionViewContentSize: CGSize {
      CGSize(width: collectionView!.bounds.size.width, height: self.contentHeight)
   }

   override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
      self.cachedLayoutAttributes.filter { $0.frame.intersects(rect) }
   }

   override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
      self.cachedLayoutAttributes[indexPath.item]
   }

   override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
      true  // ensure to re-calculate layout on orientation change
   }
}
