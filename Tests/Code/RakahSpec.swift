//
//  RakahSpec.swift
//  Prayer
//
//  Created by Cihat Gündüz on 12.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import Prayer

class RakahSpec: QuickSpec {
    override func spec() {
        it("has the correct components count for beginning rakah") {
            let rakah = Rakah(isBeginningOfPrayer: true, includesStandingRecitation: true, includesSittingRecitation: false, isEndOfPrayer: false)

            let randomRecitation = "RR"
            let expectedComponentNames = [
                "Takbīr", "Opening Supplication", "Ta'awwudh", "The Opening", randomRecitation, "Takbīr", "Ruku", "Straightening Up", "Takbīr",
                "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr"
            ]

            expect(rakah.components().count).to(equal(expectedComponentNames.count))
            for (i, component) in rakah.components().enumerated() {
                // skip comparison for random recitations
                if expectedComponentNames[i] == randomRecitation { continue }
                expect(component.name).to(equal(expectedComponentNames[i]))
            }
        }
    }
}
