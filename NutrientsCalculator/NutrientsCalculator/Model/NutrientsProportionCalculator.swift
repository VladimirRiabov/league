//
//  NutrientsProportionCalculator.swift
//  NutrientsCalculator
//
//  Created by Владимир Рябов on 24.02.2022.
//

import Foundation

enum ProportionType {
    case paleo
    case keto
}

class NutrientsProportionCalculator {
    
    func calculateDailyNutrients(proportionType: ProportionType,
                                 caloriesNumber: Int) -> Nutrients {
        var nutrients: Nutrients
        switch proportionType {
        case .paleo:
            // use calories to calculate
            // nutrients
            nutrients = Nutrients(carbs: 4, fats: 10, proteins: 8)
        case .keto:
            // use calories to calculate
            // nutrients
            nutrients = Nutrients(carbs: 6, fats: 1, proteins: 20)
        }
        return nutrients
    }
}
