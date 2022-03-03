//
//  AppDelegate.swift
//  TwoCards
//
//  Created by Владимир Рябов on 24.02.2022.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mainViewController = TwoCardsTogetherVC()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navigationController
        
        return true
    }
    
    
}

