//
//  Created by Cihat Gündüz on 23.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import HandySwift
import UIKit

final class Branding {
    // MARK: - Stored  Type Properties
    static let shared = Branding()

    // MARK: - Instance Methods
    final func setupGlobalAppearance() {
        UIApplication.shared.keyWindow?.tintColor = Color.Theme.primary
    }

    final func setupViewControllerAppearance(_ viewController: UIViewController) {
        viewController.navigationController?.navigationBar.barTintColor = Color.Theme.barBackground
        viewController.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Color.Theme.secondary
        ]

        self.setupViewAppearance(viewController.view)
    }

    final func setupViewAppearance(_ view: UIView) {
        view.tintColor = Color.Theme.accent
    }
}
