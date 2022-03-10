//
//  EmailViewController.swift
//  TwoCards
//
//  Created by Владимир Рябов on 02.03.2022.

import UIKit

class EmailViewController: UIViewController {
    
    let emailCardView = CardView(typeOfCard: .email)
    
    override func loadView() {
        view = emailCardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailCardView.delegate = self
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height / 2, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
    }
}

extension EmailViewController {
    func setup() {
        view.backgroundColor = .systemMint
    }
}

extension EmailViewController: ToNewViewController {
    func toNewVC() {
        print("sdfsdfsdfsdfsdf")
    
        let detailViewController = DetailViewController()
        let nc2 = UINavigationController(rootViewController: EmailViewController())
        
        detailViewController.detailLabel.text = "Ваш Email: \(emailCardView.inputTextField.text ?? "")\n \(emailCardView.validationResultLabel.text ?? "")."
        nc2.present(detailViewController, animated: true, completion: nil)
//        navigationController?.present(detailViewController, animated: true, completion: {
//        print("222222")
//        })
        
    }
}
