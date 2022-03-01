//
//  PeopleTableViewController.swift
//  MVVM Classic
//
//  Created by Владимир Рябов on 01.03.2022.
//

import UIKit

class PeopleTableViewController: UIViewController {
    var viewModel: TableViewViewModelType?
    lazy var tableView = TableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PeopleTableViewViewModel()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        setup()
    }
}

extension PeopleTableViewController {
    private func setup() {
        setupTableView()
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension PeopleTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        guard let cell = cell, let viewModel = viewModel else { return UITableViewCell()}
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {return 0}
        
        return viewModel.numberOfRows()
    }
}

extension PeopleTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        
        let secondViewModel = viewModel.viewModelForSelectedRow(selectedIndexPath: indexPath)
        
        let secondVC = DetailViewController()
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
        secondVC.viewModel = secondViewModel
        navigationController?.pushViewController(secondVC, animated: true)
        
    }
}
