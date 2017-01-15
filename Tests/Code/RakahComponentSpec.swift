//
//  RakahComponentSpec.swift
//  Prayer
//
//  Created by Cihat Gündüz on 12.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import Prayer

class RakahComponentSpec: QuickSpec {
    override func spec() {
        it("initializes successully") {
            let takbir = RakahComponent(.takbir)

            expect(takbir.spokenTextLines.count).to(equal(1))
            expect(takbir.spokenTextLines).to(contain("God is greater"))
        }
    }
}
