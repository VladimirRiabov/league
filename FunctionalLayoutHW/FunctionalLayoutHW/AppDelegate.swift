//
//  AppDelegate.swift
//  FunctionalLayoutHW
//
//  Created by Владимир Рябов on 19.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mainViewController = SexViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        let nc = UINavigationController(rootViewController: mainViewController)
        nc.navigationBar.prefersLargeTitles = true
        nc.navigationBar.tintColor = UIColor(red: 130.0/255.0, green: 236.0/255.0, blue: 130.0/255.0, alpha: 1.0)
        window?.rootViewController = nc
        return true
    }
}

