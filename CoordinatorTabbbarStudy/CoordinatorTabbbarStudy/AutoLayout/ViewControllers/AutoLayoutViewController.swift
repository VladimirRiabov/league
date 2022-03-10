//
//  AutoLayoutViewController.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

class AutoLayoutViewController: UIViewController, AutoLayoutBaseCoordinated {
    
    let cardAutoLayoutView = CardAutoLayoutView()
    var coordinator: AutoLayoutBaseCoordinator?
    
    override func loadView() {
        view = cardAutoLayoutView
    }
    
    init(coordinator: AutoLayoutBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "AutoLayout"
        let logoutBarButtonItem = UIBarButtonItem(title: "To Navigation", style: .done, target: self, action: #selector(goToNavigation))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        cardAutoLayoutView.plusButton.addTarget(self, action: #selector(goToNavigation), for: .touchUpInside)
        cardAutoLayoutView.moreDetailedButton.addTarget(self, action: #selector(goToSimpleTitle), for: .touchUpInside)
    }
    
    @objc private func goToNavigation() {
        coordinator?.moveTo(flow: .navigation(.initialScreen), userData: nil)
    }
    
    @objc private func goToSimpleTitle() {
        coordinator?.moveTo(flow: .largeNavigation(.simpleTitleScreen), userData: ["title": "Top Title"])
    }
    
    
}
