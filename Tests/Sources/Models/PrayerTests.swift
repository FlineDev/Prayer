//
//  Created by Cihat Gündüz on 12.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

@testable import App
import XCTest

class PrayerTests: XCTestCase {
    func testWith4Rakat() {
        let salah = Prayer.make(rakatCount: 4)
        let randomRecitation = "RR"

        XCTAssertEqual(salah.rakat.count, 4)

        // first rakah
        var expectedComponentNames = [
            "Takbīr", "Opening Supplication", "Ta'awwudh", "The Opening", randomRecitation, "Takbīr", "Ruku", "Straightening Up", "Takbīr",
            "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr"
        ]

        XCTAssertEqual(salah.rakat[0].components().count, expectedComponentNames.count)
        for (index, component) in salah.rakat[0].components().enumerated() {
            // skip comparison for random recitations
            if expectedComponentNames[index] == randomRecitation { continue }
            XCTAssertEqual(component.name, expectedComponentNames[index])
        }

        // second rakah
        expectedComponentNames = [
            "The Opening", randomRecitation, "Takbīr", "Ruku", "Straightening Up", "Takbīr",
            "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr", "Tashahhud", "Takbīr"
        ]

        XCTAssertEqual(salah.rakat[1].components().count, expectedComponentNames.count)
        for (index, component) in salah.rakat[1].components().enumerated() {
            // skip comparison for random recitations
            if expectedComponentNames[index] == randomRecitation { continue }
            XCTAssertEqual(component.name, expectedComponentNames[index])
        }

        // third rakah
        expectedComponentNames = [
            "The Opening", "Takbīr", "Ruku", "Straightening Up", "Takbīr",
            "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr"
        ]

        XCTAssertEqual(salah.rakat[2].components().count, expectedComponentNames.count)
        for (index, component) in salah.rakat[2].components().enumerated() {
            // skip comparison for random recitations
            if expectedComponentNames[index] == randomRecitation { continue }
            XCTAssertEqual(component.name, expectedComponentNames[index])
        }

        // fourth rakah
        expectedComponentNames = [
            "The Opening", "Takbīr", "Ruku", "Straightening Up", "Takbīr",
            "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr", "Tashahhud", "Salatul-'Ibrahimiyyah", "Rabbanagh", "Salâm", "Salâm"
        ]

        XCTAssertEqual(salah.rakat[3].components().count, expectedComponentNames.count)
        for (index, component) in salah.rakat[3].components().enumerated() {
            // skip comparison for random recitations
            if expectedComponentNames[index] == randomRecitation { continue }
            XCTAssertEqual(component.name, expectedComponentNames[index])
        }
    }
}
