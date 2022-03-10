//
//  NavigationViewController.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

class NavigationViewController: UIViewController, NavigationBaseCoordinated {
    var coordinator: NavigationBaseCoordinator?
    
    private lazy var priceLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Hello"
        return lable
    }()
    
    init(coordinator: NavigationBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "NavigationView"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureButton()
    }
    
    private func configureButton() {
        
        view.addSubview(priceLable)
        
        NSLayoutConstraint.activate([
            priceLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceLable.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    
}
