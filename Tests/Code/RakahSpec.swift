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
            let components = rakah.components()

            expect(components.count).to(equal(12))
        }
    }
}
