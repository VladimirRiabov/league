//
//  CompanyRaw.swift
//  URLSessionLesson10
//
//  Created by Владимир Рябов on 23.03.2022.
//

import Foundation

struct Company: Codable {
    let symbol: String
    let companyName: String
    let latestPrice: Double
    let change: Double
}
