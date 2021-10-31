//
//  Created by Cihat Gündüz on 12.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

@testable import App
import XCTest

class RakahTests: XCTestCase {
  func testCorrectComponentsCountForBeginningRakah() {
    let rakah = Rakah(
      isBeginningOfPrayer: true,
      standingRecitationPart: .init(recitation: .destiny, partLength: .short),
      includesSittingRecitation: false,
      isEndOfPrayer: false
    )

    let randomRecitation = "RR"
    let expectedComponentNames = [
      "Takbīr", "Opening Supplication", "Ta'awwudh", "📖1: al-Fatiha (The Opening)", randomRecitation, "Takbīr", "Ruku",
      "Straightening Up", "Takbīr",
      "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr",
    ]

    XCTAssertEqual(rakah.components().count, expectedComponentNames.count)
    for (index, component) in rakah.components().enumerated() {
      // skip comparison for random recitations
      if expectedComponentNames[index] == randomRecitation { continue }
      XCTAssertEqual(component.name, expectedComponentNames[index])
    }
  }

  func testCorrectComponentsCountForEndingRakah() {
    let rakah = Rakah(
      isBeginningOfPrayer: false,
      standingRecitationPart: nil,
      includesSittingRecitation: true,
      isEndOfPrayer: true
    )

    let randomRecitation = "RR"
    let expectedComponentNames = [
      "📖1: al-Fatiha (The Opening)", "Takbīr", "Ruku", "Straightening Up", "Takbīr",
      "Sajdah", "Takbīr", "Takbīr", "Sajdah", "Takbīr",
      "Tashahhud", "Salatul-'Ibrahimiyyah", "Rabbanagh", "Salâm", "Salâm",
    ]

    XCTAssertEqual(rakah.components().count, expectedComponentNames.count)
    for (index, component) in rakah.components().enumerated() {
      // skip comparison for random recitations
      if expectedComponentNames[index] == randomRecitation { continue }
      XCTAssertEqual(component.name, expectedComponentNames[index])
    }
  }
}
