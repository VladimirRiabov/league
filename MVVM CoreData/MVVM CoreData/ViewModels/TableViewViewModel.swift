//
//  ViewModel.swift
//  MVVM
//
//  Created by Владимир Рябов on 28.02.2022.
//

import UIKit
import CoreData

class TableViewViewModel: TableViewViewModelType {
    func numberOfRows() -> Int {
        return categories.count
    }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let category = categories[indexPath.row]
        return TableViewCellViewModel(category: category)
    }
    
    let container: NSPersistentContainer
    var categories: [Category] = [] {
        didSet {
            onChange?()
        }
    }
    
    var onChange: (() -> Void)?
    
    init() {
        container = NSPersistentContainer(name: "MVVM_CoreData") //exactname of the CoreData file
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getData() {
        let request = NSFetchRequest<Category>(entityName: "Category") //exact name as in the CoreData file
        do {
            try categories = container.viewContext.fetch(request)
        } catch {
            print("Error getting data. \(error.localizedDescription)")
        }
    }
    
    func addData(viewController: UIViewController) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newEntity = Category(context: self.container.viewContext)
            newEntity.name = textField.text
            self.saveData()
        }
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        viewController.present(alert, animated: true, completion: nil)
        
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            getData() //to update the published variable to reflect this change
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    func deleteCategory(_ category: Category, tableView: UITableView) {
        container.viewContext.delete(category)
        saveData()
        
    }
}
