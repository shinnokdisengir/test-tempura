//
//  AppDelegate.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Katana
import Tempura
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RootInstaller {
    var window: UIWindow?
    var store: Store<AppState, DependenciesContainer>!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.store = Store<AppState, DependenciesContainer>()

        self.window = UIWindow(frame: UIScreen.main.bounds)

        /// setup the root of the navigation
        /// this is done by invoking this method (and not in the init of the navigator)
        /// because the navigator is instantiated by the Store.
        /// this in turn will invoke the `installRootMethod` of the rootInstaller (self)
        let navigator: Navigator! = self.store!.dependencies.navigator
        navigator.start(using: self, in: self.window!, at: Screen.splash)

        return true
    }

    /// install the root of the app
    /// this method is called by the navigator when needed
    func installRoot(identifier: RouteElementIdentifier, context: Any?, completion: () -> ()) -> Bool {
        if identifier == Screen.splash.rawValue {
            let rootViewController = RootViewController(store: self.store, localState: RootLocalState())
            let navigationController = UINavigationController(rootViewController: rootViewController)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.isNavigationBarHidden = true
            self.window?.rootViewController = navigationController
            completion()
            return true
        }
        return false
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
