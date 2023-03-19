//
//  AppDelegate.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 18/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNavBar()
        initWindow()
        return true
    }
    
    private func initWindow() {
        let appRouter = AppRouter()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        appRouter.setRoot(to: .listPost, window: window, using: [:])
    }
    
    private func setupNavBar() {
        let navAppearance = UINavigationBar.appearance()
        navAppearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 24)]
    }

}

