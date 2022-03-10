//
//  CardViewXib.swift
//  CoordinatorTabbbarStudy
//
//  Created by Владимир Рябов on 10.03.2022.
//

import UIKit

class CardXibView: UIView {
   
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var promotionLable: UILabel!
    @IBOutlet weak var nameOfCourseLable: UILabel!
    @IBOutlet weak var moreDetailedButton: UIButton!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        let bundle = Bundle(for: CardXibView.self)
        bundle.loadNibNamed("CardViewXib", owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = .systemGray
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        promotionLable.text = "Акция"
        nameOfCourseLable.text = "Название курса"
        priceLable.text = "Цена"
        
        setupView()
    }
    
    private func setupView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        promotionLable.translatesAutoresizingMaskIntoConstraints = false
        nameOfCourseLable.translatesAutoresizingMaskIntoConstraints = false
        moreDetailedButton.translatesAutoresizingMaskIntoConstraints = false
        priceLable.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 12
        
        cardView.layer.cornerRadius = 12
        cardView.backgroundColor = .secondarySystemBackground
        
        plusButton.setTitle("+", for: .normal)
        plusButton.backgroundColor = .systemBlue
        plusButton.setTitleColor(.white, for: .normal)
        plusButton.layer.cornerRadius = 4
        plusButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
 
        moreDetailedButton.setTitle("Подробнее", for: .normal)
        moreDetailedButton.contentHorizontalAlignment = .left
        moreDetailedButton.backgroundColor = .clear
        moreDetailedButton.setTitleColor(.systemGray, for: .normal)
        moreDetailedButton.layer.cornerRadius = 4
        moreDetailedButton.addTarget(self, action: #selector(didTapMoreDetailedButton), for: .touchUpInside)
        
        contentView.addSubview(cardView)
        cardView.addSubview(plusButton)
        cardView.addSubview(moreDetailedButton)
        cardView.addSubview(promotionLable)
        cardView.addSubview(nameOfCourseLable)
        cardView.addSubview(priceLable)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            promotionLable.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            promotionLable.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            promotionLable.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            nameOfCourseLable.topAnchor.constraint(equalTo: promotionLable.bottomAnchor, constant: 16),
            nameOfCourseLable.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            nameOfCourseLable.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            moreDetailedButton.topAnchor.constraint(equalTo: nameOfCourseLable.bottomAnchor, constant: 16),
            moreDetailedButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            moreDetailedButton.widthAnchor.constraint(equalToConstant: 200),
//            moreDetailedButton.heightAnchor.constraint(equalToConstant: 16),
            
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
