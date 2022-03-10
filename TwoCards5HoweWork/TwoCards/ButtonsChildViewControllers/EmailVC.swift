//
//  EmailVC.swift
//  TwoCardsUpgrade
//
//  Created by Владимир Рябов on 04.03.2022.
//

import UIKit

class EmailVC: UIViewController {
    let buttonView = ButtonView(typeOfButton: .email)
    let emailViewController = EmailViewController()
    
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
        view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height / 2, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
    }
}
extension EmailVC {
    func setup() {
        view.backgroundColor = .systemMint
    }
}

extension EmailVC: ToNewViewController {
    @objc
    private func didTapValidateButton() {
        navigationController?.present(emailViewController, animated: true, completion: nil)
    }
    func toNewVC() {
        
    }
}

