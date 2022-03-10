//
//  SimpleTitleViewController.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

class SimpleTitleViewController: UIViewController, LargeNavigationBaseCoordinated {
    var coordinator: LargeNavigationBaseCoordinator?
    
    init(coordinator: LargeNavigationBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "SimpleTitle"
        
        let logoutBarButtonItem = UIBarButtonItem(title: "Large title", style: .done, target: self, action: #selector(goToLargeTitle))
            self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        
        
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    @objc private func goToLargeTitle() {
        coordinator?.moveTo(flow: .largeNavigation(.largeTitleScreen), userData: ["title": "Top Title"])
    }
}
