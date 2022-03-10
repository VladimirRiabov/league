//
//  LargeNavigationCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

class LargeNavigationCoordinator: LargeNavigationBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: LargeNavigationViewController(coordinator: self))
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: [String : Any]? = nil) {
        switch flow {
        case .largeNavigation(let screen):
            handleLargeNavigationFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    private func handleLargeNavigationFlow(for screen: LargeNavigationScreen, userData: [String: Any]?) {
        switch screen {
        case .largeTitleScreen:
            navigationRootViewController?.popToRootViewController(animated: true)
        case .simpleTitleScreen:
            guard let title = userData?["title"] as? String else { return }
            goTosimpleTitleViewController(title: title)
        }
    }
    
    func goTosimpleTitleViewController(title: String) {
        let simpleTitleViewController = SimpleTitleViewController(coordinator: self)
        simpleTitleViewController.title = title
        navigationRootViewController?.pushViewController(simpleTitleViewController, animated: true)
    }
//
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
