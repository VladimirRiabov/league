//
//  TwoCardsTogetherVC.swift
//  TwoCards
//
//  Created by Владимир Рябов on 02.03.2022.
//

import UIKit

class TwoCardsTogetherVC: UIViewController {
    
    var nameChildViewController =  NameVC()
    var emailChildViewController = EmailVC()
    var isMove = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNameViewController()
        configureEmailViewController()
    }
    
    func configureNameViewController() {
        addChild(nameChildViewController)
        view.addSubview(nameChildViewController.view)
        nameChildViewController.didMove(toParent: self)
    }
    
    func configureEmailViewController() {
        addChild(emailChildViewController)
        view.insertSubview(emailChildViewController.view, at: 1)
        emailChildViewController.didMove(toParent: self)
    }
}

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}


