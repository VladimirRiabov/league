//
//  MainCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import Foundation

protocol MainBaseCoordinator: Coordinator {
    var autoLayoutCoordinator: AutoLayoutBaseCoordinator { get }
    var xibCoordinator: XibBaseCoordinator { get }
    var manualCoordinator: ManualBaseCoordinator { get }
    var navigationCoordinator: NavigationBaseCoordinator { get }
    var largeNavigationCoordinator: LargeNavigationBaseCoordinator { get }
    
}


protocol AutoLayoutBaseCoordinated {
    var coordinator: AutoLayoutBaseCoordinator? { get }
}

protocol XibBaseCoordinated {
    var coordinator: XibBaseCoordinator? { get }
}

protocol ManualBaseCoordinated {
    var coordinator: ManualBaseCoordinator? { get }
}

protocol NavigationBaseCoordinated {
    var coordinator: NavigationBaseCoordinator? { get }
}

protocol LargeNavigationBaseCoordinated {
    var coordinator: LargeNavigationBaseCoordinator? { get }
}


