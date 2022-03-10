//
//  ManualCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

class ManualCoordinator: ManualBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: ManualViewController(coordinator: self))
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: [String : Any]? = nil) {
        switch flow {
        case .manual(let screen):
            handleManualFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    private func handleManualFlow(for screen: ManualScreen, userData: [String: Any]?) {
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
//
//    func goToFavoritesFlow() {
//        parentCoordinator?.moveTo(flow: .orders(.firstScreen))
//    }
//
//    func goToDeepViewInFavoriteTab() {
//
//        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
//                self?.parentCoordinator?.ordersCoordinator
//                    .resetToRoot(animated: false)
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now()+0.1) { [weak self] in
//                self?.parentCoordinator?.ordersCoordinator
//                    .goToOrder2Screen(animated: false)
//                    .goToOrder3Screen(animated: false)
//                self?.parentCoordinator?.moveTo(flow: .orders)
//            }
//    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
