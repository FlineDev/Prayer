//
//  Created by Cihat Gündüz on 19.03.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import XCTest

class AppStoreSnapshotUITests: XCTestCase {
  let app = XCUIApplication()
  var uiMode: String = "light"

  override func setUp() {
    super.setUp()

    continueAfterFailure = false

    setupSnapshot(app)
    app.launchArguments += ["UI_TESTS"]
    app.launch()

    uiMode = app.launchArguments.contains("DARK_MODE") ? "dark" : "light"
    XCUIDevice.shared.orientation = UIDevice.current.userInterfaceIdiom == .pad ? .landscapeLeft : .portrait
  }

  func testTakeAppStoreScreenshots() {
    var snapshotNum = 1
    let faqText = localizedString(key: "SETTINGS.FAQ_BUTTON.TITLE")
    if let faqDoneButton = app.navigationBars[faqText].buttons.allElementsBoundByIndex.first {
      faqDoneButton.tap()
    }

    if UIDevice.current.userInterfaceIdiom == .pad {
      app.swipeUp()
      snapshot("\(snapshotNum)-Settings-\(uiMode)")
      snapshotNum += 1
    }
    else {
      snapshot("\(snapshotNum)-Settings-Top-\(uiMode)")
      snapshotNum += 1

      app.swipeUp()
      snapshot("\(snapshotNum)-Settings-Bottom-\(uiMode)")
      snapshotNum += 1
    }

    if UIDevice.current.userInterfaceIdiom == .phone {
      // turn off sounds during test
      let audioModeText = localizedString(key: "SETTINGS.AUDIO_SPEED_SECTION.AUDIO_MODE.TITLE")
      app.tables.staticTexts[audioModeText].tap()

      let audioModeNone = localizedString(key: "AUDIO_MODE.NONE")
      app.tables.staticTexts[audioModeNone].tap()
    }
    else {
      let audioModeNone = localizedString(key: "AUDIO_MODE.NONE")
      app.tables.buttons[audioModeNone].tap()
    }

    // turn the text speed all up
    app.sliders.element(boundBy: 0).adjust(toNormalizedSliderPosition: 1)
    app.sliders.element(boundBy: 1).adjust(toNormalizedSliderPosition: 1)

    // Wait until starting Opening Prayer
    let startPrayerText = "🕋   " + localizedString(key: "SETTINGS.START_BUTTON.TITLE")
    app.tables.staticTexts[startPrayerText].tap()

    let openingPrayerExpectation = expectation(description: "Going to Opening Prayer")
    DispatchQueue.main.async {
      let openingText = self.localizedTextFileEntry(fileName: "001_The-Opening", lineIndex: 2)
      while !self.app.staticTexts[openingText].exists {
        _ = self.app.staticTexts.count
      }

      openingPrayerExpectation.fulfill()
    }

    waitForExpectations(timeout: 30, handler: nil)
    snapshot("\(snapshotNum)-Opening-Prayer-\(uiMode)")
    snapshotNum += 1

    // Wait until going to Ruku
    let rukuExpectation = expectation(description: "Going to Ruku Screenshot")
    DispatchQueue.main.async {
      let rukuText = self.localizedTextFileEntry(fileName: "Ruku", lineIndex: 0)
      while !self.app.staticTexts[rukuText].exists {
        _ = self.app.staticTexts.count
      }

      rukuExpectation.fulfill()
    }

    waitForExpectations(timeout: 30, handler: nil)
    snapshot("\(snapshotNum)-Ruku-\(uiMode)")
    snapshotNum += 1
  }

  private func localizedString(key: String) -> String {
    let language = String(deviceLanguage.prefix(upTo: deviceLanguage.index(deviceLanguage.startIndex, offsetBy: 2)))
    let localizationBundle = Bundle(
      path: Bundle(for: AppStoreSnapshotUITests.self).path(forResource: language, ofType: "lproj")!
    )
    return NSLocalizedString(key, bundle: localizationBundle!, comment: "")
  }

  private func localizedTextFileEntry(fileName: String, lineIndex: Int) -> String {
    let language = String(deviceLanguage.prefix(upTo: deviceLanguage.index(deviceLanguage.startIndex, offsetBy: 2)))
    let localizationBundle = Bundle(
      path: Bundle(for: AppStoreSnapshotUITests.self).path(forResource: language, ofType: "lproj")!
    )!
    let filePath = localizationBundle.path(forResource: fileName, ofType: "txt")!
    let textFileContent: String = try! String(contentsOfFile: filePath)
    return textFileContent.components(separatedBy: .newlines)[lineIndex]
  }
}
