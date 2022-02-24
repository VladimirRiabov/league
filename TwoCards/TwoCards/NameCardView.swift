//
//  NameCardView.swift
//  TwoCards
//
//  Created by Владимир Рябов on 24.02.2022.
//

import UIKit

class NameCardView: UIView {
    
    private lazy var stackView: UIStackView =  {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var cardView: UIView = {
        let cardView = UIView()
        cardView.backgroundColor = .secondarySystemBackground
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.cornerRadius = 12
        return cardView
    }()
    
    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "введите имя..."
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
    
    private lazy var validationResultLabel: UILabel = {
        let validationResultLabel = UILabel()
        validationResultLabel.translatesAutoresizingMaskIntoConstraints = false
        validationResultLabel.text = "Ожидаю валидации..."
        return validationResultLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NameCardView {
    private func configureView() {
        backgroundColor = .systemBackground
        
        backgroundColor = .systemBackground
        addSubview(cardView)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(validateButton)
        stackView.addArrangedSubview(validationResultLabel)
        cardView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: cardView.topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: cardView.leadingAnchor, multiplier: 1),
            cardView.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            cardView.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            cardView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            cardView.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 1),
            cardView.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: 1)
        ])
    }
    
    @objc
    private func didTapValidateButton() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: nameTextField.text)
        
        validationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        validationResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}
