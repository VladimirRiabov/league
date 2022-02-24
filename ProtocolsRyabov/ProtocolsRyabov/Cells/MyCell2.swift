//
//  MyCell2.swift
//  ProtocolsRyabov
//
//  Created by Владимир Рябов on 16.02.2022.
//



import Foundation
import UIKit

class MyCell2: CellParent, ShakeAndFade {
    
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
        textLabel.textColor = .purple
        textLabel.text = "2"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MyCell2: Drawer {
    func drawIcon(view: UIView) {
        
        let drawSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        
        let path = UIBezierPath(arcCenter: CGPoint(x: drawSize.width / 2, y: 0), radius: 10, startAngle: 0, endAngle: .pi, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.random().cgColor
        shapeLayer.lineWidth = 2
        
        shapeLayer.strokeColor = UIColor.random().cgColor
        
        view.layer.addSublayer(shapeLayer)
    }
    
}

