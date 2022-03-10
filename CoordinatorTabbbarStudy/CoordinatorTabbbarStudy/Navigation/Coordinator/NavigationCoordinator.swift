//
//  NavigationCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

class NavigationCoordinator: NavigationBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: NavigationViewController(coordinator: self))
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: [String : Any]? = nil) {
        switch flow {
        case .navigation(let screen):
            handleNavigationFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    private func handleNavigationFlow(for screen: NavigationScreen, userData: [String: Any]?) {
        switch screen {
        case .initialScreen:
        
            navigationRootViewController?.popToRootViewController(animated: true)
        case .doubleButtonScreen:
            guard let title = userData?["title"] as? String else { return }
            goToHome2ScreenWith(title: title)
        }
    }
    
    func goToHome2ScreenWith(title: String) {
//        let home2ViewController = Home2ViewController(coordinator: self)
//        home2ViewController.title = title
//        navigationRootViewController?.pushViewController(home2ViewController, animated: true)
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
