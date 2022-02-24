//
//  ViewController.swift
//  ProtocolsRyabov
//
//  Created by Владимир Рябов on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let sectionSpacing: CGFloat = 40.0
    
    weak var collectionView: UICollectionView!
    
    override func loadView() {
        super.loadView()
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cv)
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: view.topAnchor),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        self.collectionView = cv
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.register(MyCell2.self, forCellWithReuseIdentifier: "MyCell2")
        
    }
}

//MARK: - Data Source
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
            
            guard let cellOne = dequeuedCell as? MyCell else {
                fatalError("Wrong cell type for section 0. Expected MyCell")
            }
            return cellOne
            
        } else {
            
            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell2", for: indexPath)
            
            guard let cellTwo = dequeuedCell as? MyCell2 else {
                fatalError("Wrong cell type for section 0. Expected MyCell2")
            }
            
            return cellTwo
        }
    }
}

//MARK: - FlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 10, height: view.frame.height / 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: sectionSpacing / 2, right: 0)
        } else {
            return UIEdgeInsets(top: sectionSpacing / 2, left: 0, bottom: sectionSpacing / 2, right: 0)
        }
    }
    
}

//MARK: - DelegateMethods

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row + 1)
        if let cell = collectionView.cellForItem(at: indexPath) as? MyCell {
            cell.rotationCell(view: cell.contentView, delay: 0.01)
            cell.randomColor(view: cell.contentView, delay: 0.01)
            cell.drawIcon(view: cell.contentView)
            
            
        }
        if let cell = collectionView.cellForItem(at: indexPath) as? MyCell2 {
            cell.shake()
            cell.fadeViewInThenOut(view: cell.contentView, delay: 0.2)
            cell.randomColor(view: cell.contentView, delay: 0.01)
            cell.drawIcon(view: cell.contentView)
        }
        
    }
    
}



