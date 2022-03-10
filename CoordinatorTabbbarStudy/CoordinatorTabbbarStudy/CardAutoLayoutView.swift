//
//  CardAutoLayout.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

class CardAutoLayoutView: UIView {
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        return button
    }()
    
    lazy var moreDetailedButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Подробнее", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.backgroundColor = .clear
        button.setTitleColor(.systemGray, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapMoreDetailedButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var promotionLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Акция"
        return lable
    }()
    
    private lazy var nameOfCourselLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Название курса"
        return lable
    }()
    
    private lazy var priceLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Цена курса"
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CardAutoLayoutView {
    private func setup() {
        
        addSubview(cardView)
        cardView.addSubview(plusButton)
        cardView.addSubview(moreDetailedButton)
        cardView.addSubview(promotionLable)
        cardView.addSubview(nameOfCourselLable)
        cardView.addSubview(priceLable)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            promotionLable.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            promotionLable.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            promotionLable.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            nameOfCourselLable.topAnchor.constraint(equalTo: promotionLable.bottomAnchor, constant: 16),
            nameOfCourselLable.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            nameOfCourselLable.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            moreDetailedButton.topAnchor.constraint(equalTo: nameOfCourselLable.bottomAnchor, constant: 16),
            moreDetailedButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            moreDetailedButton.widthAnchor.constraint(equalToConstant: 100),
            
            priceLable.topAnchor.constraint(equalTo: moreDetailedButton.bottomAnchor, constant: 16),
            priceLable.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            priceLable.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            priceLable.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16),
            plusButton.topAnchor.constraint(equalTo: moreDetailedButton.bottomAnchor, constant: 16),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            plusButton.heightAnchor.constraint(equalToConstant: 40),
            plusButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            plusButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16),
        ])
    }
    
    @objc func didTapPlusButton() {
        
    }
    
    @objc func  didTapMoreDetailedButton() {
        print("Подробнее")
    }
    
}
