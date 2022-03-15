//
//  CustomCellModel.swift
//  Expandable sections
//
//  Created by Владимир Рябов on 15.03.2022.
//

import Foundation

struct CustomCellModel {
    let title: String
    let imageString: String
}

struct Section {
    var sectionName: String
    var customCells: [CustomCellModel]
    var expanded: Bool
}
