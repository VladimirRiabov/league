//
//  TableViewCellViewModelType.swift
//  MVVM Classic
//
//  Created by Владимир Рябов on 01.03.2022.
//

import Foundation

protocol TableViewCellViewModelType: AnyObject {
    var name: String { get }
    var secondName: String { get }
    var age: String { get }
}
