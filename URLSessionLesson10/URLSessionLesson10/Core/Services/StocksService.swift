//
//  StocksService.swift
//  URLSessionLesson10
//
//  Created by Владимир Рябов on 23.03.2022.
//

import Foundation

protocol StocksServiceProtocol {
    func fetchListOfCompanies(completion: @escaping (Swift.Result<ListOfCompaniesResponse, Error>) -> Void)
}

class StockService {
    static let shared = StockService()
    private let network = NetworkCore.instance
}

extension StockService {
    func fetchListOfCompanies(completion: @escaping (Result<ListOfCompaniesResponse, Error>) -> Void) {
        let metadata = "stable/stock/market/list/mostactive"
        network.request(metadata: metadata) { result in
            completion(result)
        }
    }
}
