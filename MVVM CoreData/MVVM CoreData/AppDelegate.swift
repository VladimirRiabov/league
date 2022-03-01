//
//  AppDelegate.swift
//  MVVM CoreData
//
//  Created by Владимир Рябов on 01.03.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainViewController = NotesTableViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        let navViewController = UINavigationController(rootViewController: mainViewController)
        navViewController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navViewController

        return true
    }
}

