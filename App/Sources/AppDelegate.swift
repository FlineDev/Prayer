//
//  Created by Cihat Gündüz on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import Imperio
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Stored Instance Properties
    var appCoordinator: AppCoordinator?
    var window: UIWindow?

    // MARK: - Application Lifecycle Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // global configurations
        Logger.shared.setup()
        Branding.shared.setupGlobalAppearance()

        // load initial coordinator
        appCoordinator = SettingsCoordinator()
        appCoordinator?.start()

        // set window
        window = appCoordinator?.window

        return true
    }
}
