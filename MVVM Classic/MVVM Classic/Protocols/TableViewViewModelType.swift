//
//  TableViewViewModelType.swift
//  MVVM Classic
//
//  Created by Владимир Рябов on 01.03.2022.
//

import Foundation

protocol TableViewViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
    
    func viewModelForSelectedRow(selectedIndexPath: IndexPath) -> DetailViewModelType?
}
