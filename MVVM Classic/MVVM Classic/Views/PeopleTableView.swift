//
//  TableView.swift
//  MVVM Classic
//
//  Created by Владимир Рябов on 01.03.2022.
//

import UIKit

class TableView: UITableView{
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        translatesAutoresizingMaskIntoConstraints = false
        register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
