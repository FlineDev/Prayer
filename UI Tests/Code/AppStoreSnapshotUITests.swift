//
//  Created by Cihat Gündüz on 19.03.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import XCTest

// swiftlint:disable dynamic_string_reference

class AppStoreSnapshotUITests: XCTestCase {
    // MARK: - Stored Instance Properties
    let app = XCUIApplication()

    // MARK: - Test Methods
    override func setUp() {
        super.setUp()

        continueAfterFailure = false

        setupSnapshot(app)
        app.launch()
    }

    func testTakeAppStoreScreenshots() {
        let faqText = localizedString(key: "SETTINGS.FAQ_BUTTON.TITLE")
        if let faqDoneButton = app.navigationBars[faqText].buttons.allElementsBoundByIndex.first {
            faqDoneButton.tap()
        }

        snapshot("1-Settings")

        // Wait until starting Opening Prayer
        let startPrayerText = localizedString(key: "SETTINGS.START_BUTTON.TITLE")
        app.tables.staticTexts[startPrayerText].tap()

        let openingPrayerExpectation = expectation(description: "Going to Opening Prayer")
        DispatchQueue.main.async {
            let openingText = self.localizedTextFileEntry(fileName: "001_The-Opening", lineIndex: 2)
            while !self.app.staticTexts[openingText].exists {
                _ = self.app.staticTexts.count
            }

            openingPrayerExpectation.fulfill()
        }

        waitForExpectations(timeout: 100, handler: nil)
        snapshot("2-Opening-Prayer")

        // Wait until going to Ruku
        let rukuExpectation = expectation(description: "Going to Ruku Screenshot")
        DispatchQueue.main.async {
            let rukuText = self.localizedTextFileEntry(fileName: "Ruku", lineIndex: 0)
            while !self.app.staticTexts[rukuText].exists {
                _ = self.app.staticTexts.count
            }

            rukuExpectation.fulfill()
        }

        waitForExpectations(timeout: 100, handler: nil)
        snapshot("3-Ruku")
    }

    // MARK: - Helper Methods
    private func localizedString(key: String) -> String {
        let language = String(deviceLanguage.prefix(upTo: deviceLanguage.index(deviceLanguage.startIndex, offsetBy: 2)))
        let localizationBundle = Bundle(path: Bundle(for: AppStoreSnapshotUITests.self).path(forResource: language, ofType: "lproj")!)
        return NSLocalizedString(key, bundle: localizationBundle!, comment: "")
    }

    private func localizedTextFileEntry(fileName: String, lineIndex: Int) -> String {
        let language = String(deviceLanguage.prefix(upTo: deviceLanguage.index(deviceLanguage.startIndex, offsetBy: 2)))
        let localizationBundle = Bundle(path: Bundle(for: AppStoreSnapshotUITests.self).path(forResource: language, ofType: "lproj")!)!
        let filePath = localizationBundle.path(forResource: fileName, ofType: "txt")!
        let textFileContent: String = try! String(contentsOfFile: filePath) // swiftlint:disable:this force_try
        return textFileContent.components(separatedBy: .newlines)[lineIndex]
    }
}
