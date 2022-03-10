//
//  XibViewController.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

class XibViewController: UIViewController, XibBaseCoordinated {
    var coordinator: XibBaseCoordinator?
    let cardXibView = CardXibView()
    
    override func loadView() {
        view = cardXibView
    }
    
    init(coordinator: XibBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "XibView"
        let logoutBarButtonItem = UIBarButtonItem(title: "To Navigation", style: .done, target: self, action: #selector(goToNavigation))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        cardXibView.plusButton.addTarget(self, action: #selector(goToNavigation), for: .touchUpInside)
        
    }
    
    @objc private func goToNavigation() {
        coordinator?.moveTo(flow: .navigation(.initialScreen), userData: nil)
    }
}


