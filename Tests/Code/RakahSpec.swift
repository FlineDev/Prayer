//
//  Created by Cihat Gündüz on 12.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import Nimble
@testable import Prayer
import Quick
import UIKit

class RakahSpec: QuickSpec {
    override func spec() {
        it("has the correct components count for beginning rakah") {
            let rakah = Rakah(isBeginningOfPrayer: true, includesStandingRecitation: true, includesSittingRecitation: false, isEndOfPrayer: false)

            let randomRecitation = "RR"
            let expectedComponentNames = [
                "Takbīr", "Opening Supplication", "Ta'awwudh", "The Opening", randomRecitation, "Takbīr", "Ruku", "Straightening Up", "Takbīr",
                "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr"
            ]

            expect(rakah.components().count) == expectedComponentNames.count
            for (index, component) in rakah.components().enumerated() {
                // skip comparison for random recitations
                if expectedComponentNames[index] == randomRecitation { continue }
                expect(component.name) == expectedComponentNames[index]
            }
        }

        it("has the correct components count for ending rakah") {
            let rakah = Rakah(isBeginningOfPrayer: false, includesStandingRecitation: false, includesSittingRecitation: true, isEndOfPrayer: true)

            let randomRecitation = "RR"
            let expectedComponentNames = [
                "The Opening", "Takbīr", "Ruku", "Straightening Up", "Takbīr",
                "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr",
                "Tashahhud", "Salatul-'Ibrahimiyyah", "Rabbanagh", "Salâm", "Salâm"
            ]

            expect(rakah.components().count) == expectedComponentNames.count
            for (index, component) in rakah.components().enumerated() {
                // skip comparison for random recitations
                if expectedComponentNames[index] == randomRecitation { continue }
                expect(component.name) == expectedComponentNames[index]
            }
        }
    }
}
