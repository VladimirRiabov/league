//
//  NameViewController.swift
//  TwoCards
//
//  Created by Владимир Рябов on 02.03.2022.
//

import UIKit

class NameViewController: UIViewController {
    let nameCardView = CardView(typeOfCard: .login)
    
    override func loadView() {
        view = nameCardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameCardView.delegate = self
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
    }
}

extension NameViewController {
    func setup() {
        view.backgroundColor = .systemCyan
    }
}

extension NameViewController: ToNewViewController {
    func toNewVC() {
        let detailViewController = DetailViewController()
        detailViewController.detailLabel.text = "Привет, \(nameCardView.inputTextField.text ?? "")!\n \(nameCardView.validationResultLabel.text ?? "")."
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}





