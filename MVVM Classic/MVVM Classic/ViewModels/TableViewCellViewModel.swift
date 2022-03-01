//
//  TableViewCellViewModel.swift
//  MVVM Classic
//
//  Created by Владимир Рябов on 01.03.2022.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    private var profile: Profile
    var name: String {
        return profile.name
    }
    var secondName: String {
        return profile.secondName
    }
    var age: String {
        return String(describing: profile.age)
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
