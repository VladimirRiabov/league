//
//  CellParent.swift
//  ProtocolsRyabov
//
//  Created by Владимир Рябов on 16.02.2022.
//

import Foundation
import UIKit

//MARK: - Parent cell with textLabel
//Текст "P" - Parent будет отображаться на обоих клетках (общее свойство для дочерних классов)

class CellParent: UICollectionViewCell {
    
    weak var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        textLabel = label
        
        contentView.backgroundColor = .lightGray
        textLabel.textAlignment = .left
        textLabel.text = "P"
    }  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
