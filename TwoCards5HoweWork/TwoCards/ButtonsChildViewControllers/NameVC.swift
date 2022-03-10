//
//  NameVC.swift
//  TwoCardsUpgrade
//
//  Created by Владимир Рябов on 04.03.2022.
//

import Foundation

import UIKit

class NameVC: UIViewController {
    let buttonView = ButtonView(typeOfButton: .login)
    let nameViewController = NameViewController()
    
    override func loadView() {
        view = buttonView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.validateButton.addTarget(self, action: #selector(didTapValidateButton), for: .touchUpInside)
//        nameCardView.delegate = self
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
    }
}

extension NameVC {
    func setup() {
        view.backgroundColor = .systemCyan
    }
}

extension NameVC: ToNewViewController {
    
    @objc
    private func didTapValidateButton() {
        
        navigationController?.pushViewController(nameViewController, animated: true)
        
    }
    func toNewVC() {
        
    }
}
