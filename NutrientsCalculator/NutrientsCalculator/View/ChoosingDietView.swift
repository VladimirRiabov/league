//
//  ChoosingDietView.swift
//  NutrientsCalculator
//
//  Created by Владимир Рябов on 24.02.2022.
//


import UIKit

class ChoosingDietView: UIView {
    
    private lazy var stackView = UIStackView()
    
    lazy var typeOfCalculatorSegmentedControl: UISegmentedControl = {
        let typeOfCalculatorMifflinOrHerris = UISegmentedControl()
        typeOfCalculatorMifflinOrHerris.translatesAutoresizingMaskIntoConstraints = false
        typeOfCalculatorMifflinOrHerris.insertSegment(withTitle: "Mifflin", at: 0, animated: true)
        typeOfCalculatorMifflinOrHerris.insertSegment(withTitle: "Harris Benedict", at: 1, animated: true)
        typeOfCalculatorMifflinOrHerris.selectedSegmentIndex = 0
        return typeOfCalculatorMifflinOrHerris
    }()
    
    lazy var typeOfDietSegmentedControl: UISegmentedControl = {
        let typeOfDiet = UISegmentedControl()
        typeOfDiet.translatesAutoresizingMaskIntoConstraints = false
        typeOfDiet.insertSegment(withTitle: "Paleo", at: 0, animated: true)
        typeOfDiet.insertSegment(withTitle: "Keto", at: 1, animated: true)
        typeOfDiet.selectedSegmentIndex = 0
        return typeOfDiet
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChoosingDietView {
    private func configureView() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.addArrangedSubview(typeOfCalculatorSegmentedControl)
        stackView.addArrangedSubview(typeOfDietSegmentedControl)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
    }
}
