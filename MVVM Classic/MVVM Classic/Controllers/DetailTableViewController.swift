//
//  DetailTableViewController.swift
//  MVVM Classic
//
//  Created by Владимир Рябов on 01.03.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    lazy var detailView = DetailView()
    var viewModel: DetailViewModelType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        detailView.detailLable.text = viewModel.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel?.age.bind(listener: { [weak self] in
            guard let string = $0 else {return}
            self?.detailView.detailLable.text = string
        })
        
        delay(delay: 2) {
            self.viewModel?.age.value = "после 2х секунд сработал Binding"
        }
    }
    private func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            closure()
        }
    }
}

extension DetailViewController {
    func setup() {
        detailView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailView)
        NSLayoutConstraint.activate([
            detailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
