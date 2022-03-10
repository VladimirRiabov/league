//
//  MainCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

enum AppFlow {
    case autoLayout(AutoLayoutScreen)
    case xib(XibScreen)
    case manual(ManualScreen)
    case navigation(NavigationScreen)
    case largeNavigation(LargeNavigationScreen)
    
}

enum AutoLayoutScreen {
    case initialScreen
    case modalWithoutNavigation
}

enum XibScreen {
    case initialScreen
    case doubleButtonScreen
}

enum ManualScreen {
    case initialScreen
    case doubleButtonScreen
}

enum NavigationScreen {
    case initialScreen
    case doubleButtonScreen
}

enum LargeNavigationScreen {
    case largeTitleScreen
    case simpleTitleScreen
}



class MainCoordinator: MainBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?
    

    
    lazy var autoLayoutCoordinator: AutoLayoutBaseCoordinator = AutoLayoutCoordinator()
    lazy var xibCoordinator: XibBaseCoordinator = XibCoordinator()
    lazy var manualCoordinator: ManualBaseCoordinator = ManualCoordinator()
    lazy var navigationCoordinator: NavigationBaseCoordinator = NavigationCoordinator()
    lazy var largeNavigationCoordinator: LargeNavigationBaseCoordinator = LargeNavigationCoordinator()
    

    
    lazy var rootViewController: UIViewController  = UITabBarController()
    
    func start() -> UIViewController {
        
       
        let autoLayoutViewController = autoLayoutCoordinator.start()
        autoLayoutCoordinator.parentCoordinator = self
        autoLayoutViewController.tabBarItem = UITabBarItem(title: "AL", image: UIImage(systemName: "square.on.circle"), tag: 0)
        
        let xibViewController = xibCoordinator.start()
        xibCoordinator.parentCoordinator = self
        xibViewController.tabBarItem = UITabBarItem(title: "Xib", image: UIImage(systemName: "square.grid.3x3.square"), tag: 1)
        let manualViewController = manualCoordinator.start()
        manualCoordinator.parentCoordinator = self
        manualViewController.tabBarItem = UITabBarItem(title: "Manual", image: UIImage(systemName: "hand.raised.square.on.square"), tag: 2)
        
        let navigationViewController = navigationCoordinator.start()
        navigationCoordinator.parentCoordinator = self
        navigationViewController.tabBarItem = UITabBarItem(title: "Nav", image: UIImage(systemName: "map.circle"), tag: 3)
        
        let largeNavigationViewController = largeNavigationCoordinator.start()
        largeNavigationCoordinator.parentCoordinator = self
        largeNavigationViewController.tabBarItem = UITabBarItem(title: "LNav", image: UIImage(systemName: "map"), tag: 4)
        
        (rootViewController as? UITabBarController)?.viewControllers = [autoLayoutViewController, xibViewController, manualViewController, navigationViewController, largeNavigationViewController]
                
        (rootViewController as? UITabBarController)?.tabBar.backgroundColor = .red
        (rootViewController as? UITabBarController)?.tabBar.unselectedItemTintColor = .white
        (rootViewController as? UITabBarController)?.tabBar.tintColor = UIColor.lightGray
        
        return rootViewController
    }
        
    func moveTo(flow: AppFlow, userData: [String : Any]?) {
        switch flow {
        
        case .autoLayout(_):
            goToAutoLayoutFlow(flow)
        case .xib(_):
            goToXibFlow(flow)
        case .manual(_):
            goToManualFlow(flow)
        case .navigation(_):
            goToNavigationFlow(flow)
        case .largeNavigation(_):
            goToLargeNavigationFlow(flow)
        }
    }
    
    private func goToNavigationFlow(_ flow: AppFlow) {
        (rootViewController as? UITabBarController)?.selectedIndex = 3
        navigationCoordinator.moveTo(flow: flow, userData: nil)
    }

    func resetToRoot() -> Self {
        autoLayoutCoordinator.resetToRoot(animated: false)
        moveTo(flow: .autoLayout(.initialScreen), userData: nil)
        return self
    }
    
    private func goToAutoLayoutFlow(_ flow: AppFlow) {
        (rootViewController as? UITabBarController)?.selectedIndex = 0
        navigationCoordinator.moveTo(flow: flow, userData: nil)
    }
    
    private func goToXibFlow(_ flow: AppFlow) {
        (rootViewController as? UITabBarController)?.selectedIndex = 1
        xibCoordinator.moveTo(flow: flow, userData: nil)
    }
    
    private func goToManualFlow(_ flow: AppFlow) {
        (rootViewController as? UITabBarController)?.selectedIndex = 2
        manualCoordinator.moveTo(flow: flow, userData: nil)
    }
    
    private func goToLargeNavigationFlow(_ flow: AppFlow) {
        (rootViewController as? UITabBarController)?.selectedIndex = 4
        largeNavigationCoordinator.moveTo(flow: flow, userData: nil)
        
    }

}
