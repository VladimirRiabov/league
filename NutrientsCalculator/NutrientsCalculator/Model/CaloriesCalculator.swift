//
//  CaloriesCalculator.swift
//  NutrientsCalculator
//
//  Created by Владимир Рябов on 24.02.2022.
//

import Foundation

enum CaloriesCalculationType {
    case mifflin
    case harrisBenedict
}

class CaloriesCalculator {
        
    func calculateCalories(caloriesCalculatorType: CaloriesCalculationType) -> Int {
        var targetCalories: Int
        
        switch caloriesCalculatorType {
        case .mifflin:
            targetCalories = 1200
        case .harrisBenedict:
            targetCalories = 1400
        }
        
        return targetCalories
    }
}
