//
//  Created by Cihat Gündüz on 12.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import XCTest

@testable import App

class RakahComponentTests: XCTestCase {
   func testInitializeTakbir() {
      let takbir = RakahComponent(.takbir(.standing))

      XCTAssertEqual(takbir.spokenTextLines.count, 1)
      XCTAssert(takbir.spokenTextLines.contains("God is greater"))
   }
}
