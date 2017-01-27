//
//  BrandedFormViewController.swift
//  Prayer
//
//  Created by Cihat Gündüz on 23.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import Eureka

class BrandedFormViewController: FormViewController {
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        Branding.shared.setupViewControllerAppearance(self)
    }
}
