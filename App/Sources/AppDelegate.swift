//
//  Created by Cihat Gündüz on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import AVKit
import Imperio
import TranslateKit
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
   var initialFlowCtrl: InitialFlowController?

   func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
   ) -> Bool {
      window = UIWindow(frame: UIScreen.main.bounds)
      window?.makeKeyAndVisible()

      _ = TK.Action.cancel

      // reset user defaults for UI Tests
      if ProcessInfo.processInfo.arguments.contains("UI_TESTS") {
         UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
      }

      // setup global stuff
      Logger.shared.setup()
      ErrorHandler.shared.setup(window: window!)

      // start initial flow
      initialFlowCtrl = SettingsFlowController()
      initialFlowCtrl?.start(from: window!)

      return true
   }
}

enum NetworkError: LocalizedError {
   case noConnectionToServer
   case parsingFailed

   var errorDescription: String? {  // Note: Optional String
      switch self {
      case .noConnectionToServer:
         return "No connection to the server."
      case .parsingFailed:
         return "Data parsing failed."
      }
   }

   // There are also these optional properties that are rarely used
   var failureReason: String? { nil }
   var recoverySuggestion: String? { nil }
   var helpAnchor: String? { nil }
}
