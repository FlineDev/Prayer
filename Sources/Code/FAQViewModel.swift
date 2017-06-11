//
//  FAQViewModel.swift
//  Prayer
//
//  Created by Cihat Gündüz on 19.02.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

struct FAQViewModel {
    // MARK: - Sub Types
    typealias FAQEntry = (question: String, answer: String)

    // MARK: - Stored Instance Properties
    let entries: [FAQEntry]
}
