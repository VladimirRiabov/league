//
//  TableViewController.swift
//  TableViewDragAndDrop
//
//  Created by Владимир Рябов on 16.03.2022.
//

import UIKit

class TableContr: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var teams = Teams().teams
    //MARK: - Table
    private let customCellId = "customCellId"
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    
    //MARK: - Sections
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return teams.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams[section].players.count
    }
    
    //MARK: - Cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = teams[indexPath.section].players[indexPath.row].namePlayer
        cell.detailTextLabel?.text = teams[indexPath.section].players[indexPath.row].agePlayer
        return cell
    }
    
    //MARK: - Header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        teams[section].nameOfTheTeam
    }
    
    
    //MARK: - Footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return String("Summ of players: \(teams[section].players.count)")
    }
    
    
    
    //MARK: - Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addingTabBarItems()
    }
    
    private func setup() {
        title = "Championship"
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    private func addingTabBarItems() {
        let sortButton = UIBarButtonItem(title: "Sort", style: .plain, target: self , action: #selector (sortButtonTapped))
        navigationItem.leftBarButtonItem  = sortButton
        
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self , action: #selector (addButtonTapped))
        navigationItem.rightBarButtonItem  = addButton
    }
    
    //MARK: - Move cells
    @objc func sortButtonTapped() {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let cellToMove = teams[sourceIndexPath.section].players[sourceIndexPath.row]
        teams[destinationIndexPath.section].players.insert(cellToMove, at: destinationIndexPath.row)
        teams[sourceIndexPath.section].players.remove(at: sourceIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        if let textlabel = header.textLabel {
            textlabel.textColor = .orange
        }
    }
    //MARK: - DeletingCells
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        teams[indexPath.section].players.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.beginUpdates()
        tableView.footerView(forSection: indexPath.section)?.textLabel?.text = String("Summ of players: \(teams[indexPath.section].players.count)")
        tableView.endUpdates()
    }
    
    
    //MARK: - Adding players
    @objc func addButtonTapped() {
        var teamTextField = UITextField()
        var playerTextField = UITextField()
        var playerAgeTextField = UITextField()
        
        let alert = UIAlertController(title: "Add New Player", message: "Enter team/name/age", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            guard let teamName = teamTextField.text else { return }
            guard let playerName = playerTextField.text else { return }
            guard let playerAge = playerAgeTextField.text else { return }
            
            if let i1 = self.teams.firstIndex(where: {$0.nameOfTheTeam == teamName}) {
                self.teams[i1].players.append(Player(namePlayer: playerName, agePlayer: playerAge))
            } else {
                self.teams.append(Team(nameOfTheTeam: teamName, players: [Player(namePlayer: playerName, agePlayer: playerAge)]))
            }
            
            self.tableView.reloadData()
        }
        alert.addAction(action)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Team name"
            teamTextField = alertTextField
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Player name"
            playerTextField = alertTextField
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Age of the player"
            playerAgeTextField = alertTextField
        }
        present(alert, animated: true, completion: nil)
    }
}
