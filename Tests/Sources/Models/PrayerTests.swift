//
//  Created by Cihat Gündüz on 12.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import XCTest

@testable import App

class PrayerTests: XCTestCase {
   func testWith4Rakat() {
      let prayer = Prayer(rakatCount: 4, allowLongerRecitations: false, allowSplittingRecitations: false)
      let randomRecitation = "RR"

      XCTAssertEqual(prayer.rakat.count, 4)

      // first rakah
      var expectedComponentNames = [
         "Takbīr", "Opening Supplication", "Ta'awwudh", "📖1: al-Fatiha (The Opening)", randomRecitation, "Takbīr", "Ruku",
         "Straightening Up", "Takbīr",
         "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr",
      ]

      XCTAssertEqual(prayer.rakat[0].components().count, expectedComponentNames.count)
      for (index, component) in prayer.rakat[0].components().enumerated() {
         // skip comparison for random recitations
         if expectedComponentNames[index] == randomRecitation { continue }
         XCTAssertEqual(component.name, expectedComponentNames[index])
      }

      // second rakah
      expectedComponentNames = [
         "📖1: al-Fatiha (The Opening)", randomRecitation, "Takbīr", "Ruku", "Straightening Up", "Takbīr",
         "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr", "Tashahhud", "Takbīr",
      ]

      XCTAssertEqual(prayer.rakat[1].components().count, expectedComponentNames.count)
      for (index, component) in prayer.rakat[1].components().enumerated() {
         // skip comparison for random recitations
         if expectedComponentNames[index] == randomRecitation { continue }
         XCTAssertEqual(component.name, expectedComponentNames[index])
      }

      // third rakah
      expectedComponentNames = [
         "📖1: al-Fatiha (The Opening)", "Takbīr", "Ruku", "Straightening Up", "Takbīr",
         "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr",
      ]

      XCTAssertEqual(prayer.rakat[2].components().count, expectedComponentNames.count)
      for (index, component) in prayer.rakat[2].components().enumerated() {
         // skip comparison for random recitations
         if expectedComponentNames[index] == randomRecitation { continue }
         XCTAssertEqual(component.name, expectedComponentNames[index])
      }

      // fourth rakah
      expectedComponentNames = [
         "📖1: al-Fatiha (The Opening)", "Takbīr", "Ruku", "Straightening Up", "Takbīr",
         "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr", "Tashahhud", "Salatul-'Ibrahimiyyah", "Rabbanagh", "Salâm",
         "Salâm",
      ]

      XCTAssertEqual(prayer.rakat[3].components().count, expectedComponentNames.count)
      for (index, component) in prayer.rakat[3].components().enumerated() {
         // skip comparison for random recitations
         if expectedComponentNames[index] == randomRecitation { continue }
         XCTAssertEqual(component.name, expectedComponentNames[index])
      }
   }
}
