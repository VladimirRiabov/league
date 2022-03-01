//
//  CustomTableViewCell.swift
//  MVVM Classic
//
//  Created by Владимир Рябов on 01.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let name = UILabel()
    let secondName = UILabel()
    let age = UILabel()
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {
                return
            }
            name.text = viewModel.name
            secondName.text = viewModel.secondName
            age.text = viewModel.age
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        secondName.translatesAutoresizingMaskIntoConstraints = false
        age.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(name)
        contentView.addSubview(secondName)
        contentView.addSubview(age)
        
        let views = [
            "name"  : name,
            "secondName" : secondName,
            "age": age,
        ]
        
        var allConstraints: [NSLayoutConstraint] = []
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[age]-|", options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[name]-[secondName]-|", options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[name]-|", options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[secondName]-[age]-|", options: [], metrics: nil, views: views)
        
        NSLayoutConstraint.activate(allConstraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


