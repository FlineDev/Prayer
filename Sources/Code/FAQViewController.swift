//
//  FAQViewController.swift
//  Prayer
//
//  Created by Cihat Gündüz on 19.02.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import Imperio

enum FAQAction {
    case doneButtonPressed
}

class FAQViewController: BrandedViewController, Coordinatable {
    // MARK: - Coordinatable Protocol Implementation

    typealias Action = FAQAction
    var coordinate: ((FAQAction) -> Void)!


    // MARK: - Stored Instance Properties

    let l10n = L10n.Settings.Faq.self

    var viewModel: FAQViewModel! {
        didSet {
            // TODO: not yet implemented
        }
    }


    // MARK: - IBAction Methods

    @IBAction func doneButtonPressed() {
        coordinate(.doneButtonPressed)
    }


    // MARK: - View Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        title = l10n.title
    }
}
