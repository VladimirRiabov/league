//
//  MainViewController.swift
//  TwoCards
//
//  Created by Владимир Рябов on 24.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var stackView: UIStackView =  {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()
    
    private lazy var nameCardView: NameCardView = {
        let view = NameCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emailCardView: EmailCardView = {
        let view = EmailCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
}

extension MainViewController {
    private func configureView() {
        view.backgroundColor = .systemBackground
        
        stackView.addArrangedSubview(nameCardView)
        stackView.addArrangedSubview(emailCardView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }
}
