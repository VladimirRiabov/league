//
//  CardViewManual.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

class CardManualView: UIView {
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var moreDetailedButton: UIButton = {
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
    
    private lazy var boardForPromotion: UIView  = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.systemGray.cgColor
        return view
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
        
//        setup()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
}


extension CardManualView {

    override func layoutSubviews() {
        setup()

    }
    private func setup() {

        addSubview(cardView)
        cardView.addSubview(plusButton)
        cardView.addSubview(moreDetailedButton)
        cardView.addSubview(promotionLable)
        cardView.addSubview(nameOfCourselLable)
        cardView.addSubview(priceLable)
    
        let standartHeight = CGFloat(16)
        let standartWidth = CGFloat(UIScreen.main.bounds.width - 40)
        
        
        cardView.frame = CGRect(x: 10, y: safeAreaInsets.top, width: UIScreen.main.bounds.width - 20, height: 180)
        promotionLable.frame = CGRect(x: 16, y: 16, width: Int(standartWidth), height: Int(standartHeight))
        nameOfCourselLable.frame = CGRect(x: promotionLable.frame.minX, y: promotionLable.frame.maxY, width: standartWidth, height: standartHeight * 2)
        moreDetailedButton.frame = CGRect(x: promotionLable.frame.minX, y: nameOfCourselLable.frame.maxY, width: standartWidth, height: standartHeight)
        priceLable.frame = CGRect(x: promotionLable.frame.minX, y: moreDetailedButton.frame.maxY + 50, width: standartWidth, height: standartHeight * 2)
        plusButton.frame = CGRect(x: cardView.frame.maxX - 100, y: priceLable.frame.maxY - 50, width: 80, height: standartHeight * 2)
    }
    
    @objc func didTapPlusButton() {
        
    }
    
    @objc func  didTapMoreDetailedButton() {
        print("Подробнее")
    }
    
}
