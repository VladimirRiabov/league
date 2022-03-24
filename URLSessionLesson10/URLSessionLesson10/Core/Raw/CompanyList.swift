//
//  CompanyList.swift
//  URLSessionLesson10
//
//  Created by Владимир Рябов on 23.03.2022.
//

import Foundation

struct ListOfCompaniesResponse: Responsable {
    let array: [Company]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let values = try container.decode([Company].self)
        array = values
    }
}
