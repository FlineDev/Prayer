//
//  Created by Cihat Gündüz on 12.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

@testable import App
import XCTest

class RakahComponentTests: XCTestCase {
  func testInitializeTakbir() {
    let takbir = RakahComponent(.takbir(.standing))

    XCTAssertEqual(takbir.spokenTextLines.count, 1)
    XCTAssert(takbir.spokenTextLines.contains("God is greater"))
  }

  func testEnsurePresenceOfAllFiles() {
    Rakah.Component.all.forEach { componentCase in
      let component = RakahComponent(componentCase)

      XCTAssertFalse(component.spokenTextLines.isEmpty)
    }
  }
}
