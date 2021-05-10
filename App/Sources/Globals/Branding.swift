//
//  Created by Cihat Gündüz on 23.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

final class Branding {
  // MARK: - Stored Type Properties
  static let shared = Branding()

  // MARK: - Instance Methods
  func setup(window: UIWindow) {
    window.tintColor = Colors.Theme.primary
  }

  func setupViewControllerAppearance(_ viewController: UIViewController) {
    viewController.navigationController?.navigationBar.barTintColor = Colors.Theme.barBackground
    viewController.navigationController?.navigationBar.titleTextAttributes = [
      NSAttributedString.Key.foregroundColor: Colors.Theme.secondary
    ]

    self.setupViewAppearance(viewController.view)
  }

  func setupViewAppearance(_ view: UIView) {
    view.tintColor = Colors.Theme.accent
  }
}
