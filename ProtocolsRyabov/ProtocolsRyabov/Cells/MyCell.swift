//
//  MyCell.swift
//  ProtocolsRyabov
//
//  Created by Владимир Рябов on 16.02.2022.
//

import Foundation
import UIKit

class MyCell: CellParent, Rotate {
    
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
        textLabel.textAlignment = .right
        textLabel.font = .boldSystemFont(ofSize: 16)
        textLabel.textColor = .systemBlue
        textLabel.text = "1"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension MyCell: Drawer {
    func drawIcon(view: UIView) {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 10, y: 0))
        path.addLine(to: CGPoint(x: 10, y: 10))
        path.addLine(to: CGPoint(x: 0, y: 10))
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.random().cgColor
        shapeLayer.fillColor = UIColor.random().cgColor
        shapeLayer.lineWidth = 2
        
        view.layer.addSublayer(shapeLayer)
    }
}

