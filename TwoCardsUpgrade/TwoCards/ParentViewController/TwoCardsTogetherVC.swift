//
//  TwoCardsTogetherVC.swift
//  TwoCards
//
//  Created by Владимир Рябов on 02.03.2022.
//

import UIKit

class TwoCardsTogetherVC: UIViewController {
    
    var nameChildViewController =  NameViewController()
    var emailChildViewController = EmailViewController()
    var isMove = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFoodViewController()
        configureMenuViewController()
    }
    
    func configureFoodViewController() {
        addChild(nameChildViewController)
        view.addSubview(nameChildViewController.view)
        nameChildViewController.didMove(toParent: self)
    }
    
    func configureMenuViewController() {
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
    
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}


