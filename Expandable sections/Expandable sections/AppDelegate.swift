//
//  AppDelegate.swift
//  Expandable sections
//
//  Created by Владимир Рябов on 11.03.2022.
//

import UIKit

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mainViewController = TableViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let nc = UINavigationController(rootViewController: mainViewController)
        nc.navigationBar.prefersLargeTitles = true
        
        window?.rootViewController = nc
        
        return true
    }
    
    
}

