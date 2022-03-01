//
//  AppDelegate.swift
//  MVVM Classic
//
//  Created by Владимир Рябов on 01.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mainViewController = PeopleTableViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        let navViewController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navViewController
        
        return true
    }
    
}

