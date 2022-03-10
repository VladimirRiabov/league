//
//  ButtonView.swift
//  TwoCardsUpgrade
//
//  Created by Владимир Рябов on 04.03.2022.
//

import UIKit

//protocol ToNewViewController: AnyObject {
//    func toNewVC()
//}

enum TypeOfButton{
    case email
    case login
}

class ButtonView: UIView {
    var typeOfButton: TypeOfButton
    weak var delegate: ToNewViewController?
    private var regExString = ""

    lazy var inputTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = typeOfButton == .email ? "Введите email..." : "Введите имя и фамилию..."
        nameTextField.borderStyle = .roundedRect
        nameTextField.backgroundColor = .systemBackground
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.autocapitalizationType = .none
        return nameTextField
    }()
    
    lazy var validateButton: UIButton = {
        let validateButton = UIButton(type: .system)
        validateButton.translatesAutoresizingMaskIntoConstraints = false
        validateButton.setTitle(typeOfButton == .email ? "Введите email..." : "Введите имя и фамилию...", for: .normal)
        validateButton.setTitle("Не дави на меня!", for: .highlighted)
        validateButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        validateButton.backgroundColor = .systemBlue
        validateButton.setTitleColor(.white, for: .normal)
        validateButton.layer.cornerRadius = 4
        return validateButton
    }()

    
    init(typeOfButton: TypeOfButton) {
        self.typeOfButton = typeOfButton
        super.init(frame: .zero)
        backgroundColor = .red
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonView {
    private func configureView() {
        backgroundColor = .clear
        addSubview(validateButton)
        
        NSLayoutConstraint.activate([
            validateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            validateButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}

