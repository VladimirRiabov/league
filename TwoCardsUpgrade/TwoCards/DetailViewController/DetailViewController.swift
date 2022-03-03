//
//  DetailViewController.swift
//  TwoCardsUpgrade
//
//  Created by Владимир Рябов on 03.03.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    lazy var detailLabel: UILabel = {
        let detailLabel = UILabel()
        detailLabel.textColor = .white
        detailLabel.font = .boldSystemFont(ofSize: 18)
        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = .center
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailLabel
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension DetailViewController {
    func setup() {
        view.backgroundColor = .systemTeal
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailLabel)
        NSLayoutConstraint.activate([
            detailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
