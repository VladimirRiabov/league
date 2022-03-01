//
//  TableViewModelType.swift
//  MVVM
//
//  Created by Владимир Рябов on 28.02.2022.
//

import Foundation

protocol TableViewViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
}


