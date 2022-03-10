//
//  LargeNavigationViewController.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

class LargeNavigationViewController: UIViewController, LargeNavigationBaseCoordinated {
    var coordinator: LargeNavigationBaseCoordinator?
    
    init(coordinator: LargeNavigationBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        
        title = "LargeNavigation"
        
        let logoutBarButtonItem = UIBarButtonItem(title: "Simple title", style: .done, target: self, action: #selector(goToSimpleTitle))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    
    @objc private func goToSimpleTitle() {
        coordinator?.moveTo(flow: .largeNavigation(.simpleTitleScreen), userData: ["title": "Top Title"])
    }
}
