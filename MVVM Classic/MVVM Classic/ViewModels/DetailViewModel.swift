//
//  DetailViewModel.swift
//  MVVM Classic
//
//  Created by Владимир Рябов on 01.03.2022.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    var age: Box<String?> = Box(nil)
    private var profile: Profile
    var description: String {
        return String(describing: "\(profile.name) \(profile.secondName) \(profile.age) лет")
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
