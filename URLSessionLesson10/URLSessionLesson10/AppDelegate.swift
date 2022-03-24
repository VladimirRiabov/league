//
//  AppDelegate.swift
//  URLSessionLesson10
//
//  Created by Владимир Рябов on 22.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mainViewController = ResultViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        let nc = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = nc
        return true
    }
}


