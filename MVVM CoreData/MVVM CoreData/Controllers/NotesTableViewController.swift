//
//  NotesTableViewController.swift
//  MVVM CoreData
//
//  Created by Владимир Рябов on 01.03.2022.
//


import CoreData
import UIKit

class NotesTableViewController: UIViewController {
    var viewModel: TableViewViewModel?
    lazy var tableView = TableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.title = "Notes"
        
        viewModel = TableViewViewModel()
        guard let viewModel = viewModel else { return }
        viewModel.getData()
        viewModel.onChange = {
            self.tableView.reloadData()
        }
        setup()
    }
}
//MARK: - DataSource
extension NotesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        guard let cell = cell else { return UITableViewCell()}
        guard let viewModel = viewModel else { return UITableViewCell()}
        
        cell.name.numberOfLines = 0
        
        cell.name.text = viewModel.categories[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {return 0}
        return viewModel.categories.count
    }
}
//MARK: - TableViewDelegate
extension NotesTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            guard let viewModel = viewModel else { return }
            viewModel.deleteCategory(viewModel.categories[indexPath.row], tableView: tableView)
        }
    }
}

extension NotesTableViewController {
    @objc func addTapped() {
        viewModel?.addData(viewController: self)
    }
}

extension NotesTableViewController {
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

