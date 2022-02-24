//
//  AppDelegate.swift
//  NutrientsCalculator
//
//  Created by Владимир Рябов on 23.02.2022.
//

import UIKit

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mainViewController = ViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        window?.rootViewController = mainViewController
        
        
        return true
    }
    
    
}

