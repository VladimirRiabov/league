//
//  TableViewCellViewModel.swift
//  MVVM
//
//  Created by Владимир Рябов on 28.02.2022.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    private var category: Category
    var name: String {
        return category.name ?? ""
    }
    init(category: Category) {
        self.category = category
    }
}
