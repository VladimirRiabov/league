//
//  DetailView.swift
//  MVVM Classic
//
//  Created by Владимир Рябов on 01.03.2022.
//


import UIKit

class DetailView: UIView {
    
    lazy var detailLable: UILabel = {
        let detailLable =  UILabel()
        
        detailLable.translatesAutoresizingMaskIntoConstraints = false
        detailLable.text = ""
        
        return detailLable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailView {
    private func setup() {
        addSubview(detailLable)
        NSLayoutConstraint.activate([
            detailLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailLable.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
