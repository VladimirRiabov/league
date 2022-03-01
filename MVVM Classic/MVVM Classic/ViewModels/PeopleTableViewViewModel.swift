//
//  PeopleTableViewViewModel.swift
//  MVVM Classic
//
//  Created by Владимир Рябов on 01.03.2022.
//

import Foundation
import UIKit

class PeopleTableViewViewModel: TableViewViewModelType {
   
    func numberOfRows() -> Int {
        return profiles.count
    }
    var profiles = [Profile(name: "Имя1", secondName: "Фамилия1", age: 10),
                Profile(name: "Имя2", secondName: "Фамилия2", age: 20),
                Profile(name: "Имя3", secondName: "Фамилия3", age: 30)]
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
    
    private var selectedIndexPath: IndexPath?
    func viewModelForSelectedRow(selectedIndexPath: IndexPath) -> DetailViewModelType? {
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }

}
