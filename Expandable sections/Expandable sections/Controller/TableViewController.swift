//
//  TableViewController.swift
//  Expandable sections
//
//  Created by Владимир Рябов on 11.03.2022.
//

import UIKit

class TableViewController: UIViewController, ExpandableHeaderViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var music = Music()
    
    private let customCellId = "customCellId"
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.estimatedRowHeight = 300
        tv.rowHeight = UITableView.automaticDimension
        tv.register(CustomCell.self, forCellReuseIdentifier: customCellId)
        return tv
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return music.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if music.sections[section].expanded {
            return music.sections[section].customCells.count
        } else  {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: customCellId,
            for: indexPath
        ) as? CustomCell else { return UITableViewCell() }
        
        
        
        cell.configureCell(title: music.sections[indexPath.section].customCells[indexPath.row].title, imageString: music.sections[indexPath.section].customCells[indexPath.row].imageString)
        cell.button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if music.sections[indexPath.section].expanded {
            return UITableView.automaticDimension
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.setup(withTitle: music.sections[section].sectionName, section: section, delegate: self)
        return header
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        music.sections[section].expanded = !music.sections[section].expanded
        tableView.reloadSections(IndexSet(integer: section), with: .none)
        view.layoutIfNeeded()
    }
    
    @objc func addButtonTapped(sender: UIButton) {
        sender.showAnimation {
        }
        print("добавлено")
    }
    
}

extension TableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "Альбомы"
    }
    
    func setup() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
}





