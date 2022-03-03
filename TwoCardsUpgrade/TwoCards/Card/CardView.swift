//
//  NameCardView.swift
//  TwoCards
//
//  Created by Владимир Рябов on 24.02.2022.
//

import UIKit

protocol ToNewViewController: AnyObject {
    func toNewVC()
}

enum TypeOfCard {
    case email
    case login
}

class CardView: UIView {
    var typeOfCard: TypeOfCard
    weak var delegate: ToNewViewController?
    private var regExString = ""
    
    private lazy var cardView: UIView = {
        let cardView = UIView()
        cardView.backgroundColor = .secondarySystemBackground
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.cornerRadius = 12
        return cardView
    }()
    
    lazy var inputTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = typeOfCard == .email ? "Введите email..." : "Введите имя и фамилию..."
        nameTextField.borderStyle = .roundedRect
        nameTextField.backgroundColor = .systemBackground
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.autocapitalizationType = .none
        return nameTextField
    }()
    
    private lazy var validateButton: UIButton = {
        let validateButton = UIButton(type: .system)
        validateButton.translatesAutoresizingMaskIntoConstraints = false
        validateButton.setTitle("Валидировать", for: .normal)
        validateButton.setTitle("Не дави на меня!", for: .highlighted)
        validateButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        validateButton.backgroundColor = .systemBlue
        validateButton.setTitleColor(.white, for: .normal)
        validateButton.layer.cornerRadius = 4
        validateButton.addTarget(self, action: #selector(didTapValidateButton), for: .touchUpInside)
        return validateButton
    }()
    
    lazy var validationResultLabel: UILabel = {
        let validationResultLabel = UILabel()
        validationResultLabel.translatesAutoresizingMaskIntoConstraints = false
        validationResultLabel.text = "Ожидаю валидации..."
        return validationResultLabel
    }()
    
    init(typeOfCard: TypeOfCard) {
        self.typeOfCard = typeOfCard
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        inputTextField.delegate = self
        backgroundColor = .red
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardView {
    private func configureView() {
        backgroundColor = .clear
        addSubview(cardView)
        cardView.addSubview(inputTextField)
        cardView.addSubview(validateButton)
        cardView.addSubview(validationResultLabel)
        
        NSLayoutConstraint.activate([
            
            cardView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardView.widthAnchor.constraint(equalToConstant: 300),
            cardView.heightAnchor.constraint(equalToConstant: 125),
            inputTextField.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            inputTextField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            inputTextField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            validateButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            validateButton.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 10),
            validateButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            validationResultLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            validationResultLabel.topAnchor.constraint(equalTo: validateButton.bottomAnchor, constant: 10),
            validationResultLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
        ])
    }
    
    @objc
    private func didTapValidateButton() {
        if typeOfCard == .login {
            regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        } else {
            regExString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        }
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: inputTextField.text)
        validationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        validationResultLabel.textColor = isValid ? .systemGreen : .systemRed
        
        if isValid {
            delegate?.toNewVC()
        } else {
            return
        }
    }
}

extension CardView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        inputTextField.resignFirstResponder()
        return true
    }
}
