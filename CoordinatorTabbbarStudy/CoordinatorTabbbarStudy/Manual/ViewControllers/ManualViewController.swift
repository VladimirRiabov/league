//
//  ManualViewController.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

class ManualViewController: UIViewController, ManualBaseCoordinated {
    var coordinator: ManualBaseCoordinator?
//    let cardManualView = CardView(typeOfCard: .email)
    let cardManualView = CardManualView()
    
        override func loadView() {
            view = cardManualView
        }
    
    init(coordinator: ManualBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "ManualView"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        view.addSubview(cardManualView)
//        cardManualView.translatesAutoresizingMaskIntoConstraints = false
//        cardManualView.frame = CGRect(x: 20, y: 100, width: self.view.frame.width - 40, height: cardManualView.bounds.height)
    }
    
    private func configureView() {
//        view.addSubview(cardManualView)
//        cardManualView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            cardManualView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            cardManualView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//
//        ])
    }
    
    @objc private func goToHome2() {
//        coordinator?.moveTo(flow: .home(.doubleButtonScreen), userData: ["title": "Top Title"])
    }
}

//import UIKit
//
//class AutoLayoutViewController: UIViewController, AutoLayoutBaseCoordinated {
//
//    let cardAutoLayoutView = CardAutoLayoutView()
//
//    var coordinator: AutoLayoutBaseCoordinator?
//
//    var goToHome2button: UIButton!
//
//    override func loadView() {
//        view = cardAutoLayoutView
//    }
//
//    init(coordinator: AutoLayoutBaseCoordinator) {
//        super.init(nibName: nil, bundle: nil)
//        self.coordinator = coordinator
//        title = "AutoLayout"
//        let logoutBarButtonItem = UIBarButtonItem(title: "To Navigation", style: .done, target: self, action: #selector(goToNavigation))
//            self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//    }
//
//    @objc private func goToNavigation() {
//        coordinator?.moveTo(flow: .navigation(.initialScreen), userData: nil)
//    }
//}
