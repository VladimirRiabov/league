//
//  AutoLayoutCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//


import UIKit

class AutoLayoutCoordinator: AutoLayoutBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: AutoLayoutViewController(coordinator: self))
        
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: [String : Any]? = nil) {
        switch flow {
        case .autoLayout(let screen):
            handleAutoLayoutFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    private func handleAutoLayoutFlow(for screen: AutoLayoutScreen, userData: [String: Any]?) {
        switch screen {
        case .initialScreen:
            navigationRootViewController?.popToRootViewController(animated: true)
        case .modalWithoutNavigation:
            goTomodalWithoutNavigationViewCOntroller()
        }
    }
    
    func goTomodalWithoutNavigationViewCOntroller() {
        let modalWithoutNavigationViewCOntroller = UIViewController()
        
        navigationRootViewController?.pushViewController(modalWithoutNavigationViewCOntroller, animated: true)
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
