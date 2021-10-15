//
//  Created by Cihat Gündüz on 25.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

class BrandedNavigationController: UINavigationController {
  // MARK: - View Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()

    Branding.shared.setupViewControllerAppearance(self)
  }

  override var shouldAutorotate: Bool {
    topViewController!.shouldAutorotate
  }

  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    topViewController!.supportedInterfaceOrientations
  }
}
