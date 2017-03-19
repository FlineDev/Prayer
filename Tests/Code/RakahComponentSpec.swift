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
        it("initializes successully with takbir") {
            let takbir = RakahComponent(.takbir(.standing))

            expect(takbir.spokenTextLines.count).to(equal(1))
            expect(takbir.spokenTextLines).to(contain("God is greater"))
        }

        it("ensures the existence and non-emptyness of a file for each case") {
            Rakah.Component.all.forEach { componentCase in
                let component = RakahComponent(componentCase)

                expect(component.spokenTextLines).notTo(beEmpty())
            }
        }
    }
}
