
//  CustomCell.swift
//  MVVM
//
//  Created by Владимир Рябов on 28.02.2022.
//


import UIKit

class CustomTableViewCell: UITableViewCell {
    let name = UILabel()
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {
                return
            }
            name.text = viewModel.name
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        name.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(name)
        name.numberOfLines = 0
        let views = ["name": name]
        
        var allConstraints: [NSLayoutConstraint] = []
        
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[name]-|", options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[name]-|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(allConstraints)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
