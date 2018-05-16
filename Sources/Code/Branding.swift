//
//  Created by Cihat Gündüz on 23.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import HandySwift
import UIKit

class Branding {
    // MARK: - Stored  Type Properties
    static let shared = Branding()

    // MARK: - Instance Methods
    final func setupGlobalAppearance() {
        UIApplication.shared.keyWindow?.tintColor = Color(named: .primary)
    }

    final func setupViewControllerAppearance(_ viewController: UIViewController) {
        viewController.navigationController?.navigationBar.barTintColor = Color(named: .background).change(.brightness, to: 0.9)
        viewController.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: Color(named: .secondary)
        ]

        self.setupViewAppearance(viewController.view)
    }

    final func setupViewAppearance(_ view: UIView) {
        view.tintColor = Color(named: .accent)
    }
}
