//
//  ViewController.swift
//  NutrientsCalculator
//
//  Created by Владимир Рябов on 23.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var calculateButton: UIButton = {
        let calculateButton = UIButton(type: .system)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.setTitle("Рассчитать", for: .normal)
        calculateButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        calculateButton.backgroundColor = .systemBlue
        calculateButton.setTitleColor(.white, for: .normal)
        calculateButton.layer.cornerRadius = 4
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return calculateButton
    }()
    
    private lazy var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = "Нажми рассчитать для получения результата..."
        return resultLabel
    }()
    
    var caloriesCalculator = CaloriesCalculator()
    var nutrientsCalculator = NutrientsProportionCalculator()
    
    var choosingDietView = ChoosingDietView()
    
    var caloriesCalculationType: CaloriesCalculationType = .mifflin
    var dietType: ProportionType = .keto
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
}

extension ViewController {
    private func configureView() {
        
        view.addSubview(choosingDietView)
        view.addSubview(calculateButton)
        view.addSubview(resultLabel)
        choosingDietView.translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            choosingDietView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            choosingDietView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: choosingDietView.trailingAnchor, multiplier: 1)
            
        ])
        
        NSLayoutConstraint.activate([
            calculateButton.topAnchor.constraint(equalToSystemSpacingBelow: choosingDietView.bottomAnchor, multiplier: 2),
            calculateButton.leadingAnchor.constraint(equalTo: choosingDietView.leadingAnchor),
            calculateButton.trailingAnchor.constraint(equalTo: choosingDietView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalToSystemSpacingBelow: calculateButton.bottomAnchor, multiplier: 2),
            resultLabel.leadingAnchor.constraint(equalTo: choosingDietView.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: choosingDietView.trailingAnchor)
        ])
        
    }
}

extension ViewController {
    @objc func calculateButtonTapped(sender: UIButton) {
        calculation()
    }
    
    func calculation() {
        if choosingDietView.typeOfCalculatorSegmentedControl.selectedSegmentIndex == 0 {
            caloriesCalculationType = .mifflin
        } else {
            caloriesCalculationType = .harrisBenedict
        }
        
        if choosingDietView.typeOfDietSegmentedControl.selectedSegmentIndex == 0 {
            dietType = .keto
        } else {
            dietType = .paleo
        }
        
        resultLabel.text = "\(nutrientsCalculator.calculateDailyNutrients(proportionType: dietType, caloriesNumber: caloriesCalculator.calculateCalories(caloriesCalculatorType: caloriesCalculationType)))"
    }
}



