//
//  ExpandableHeaderView.swift
//  Expandable sections
//
//  Created by Владимир Рябов on 12.03.2022.
//

import UIKit

protocol ExpandableHeaderViewDelegate: AnyObject {
    func toggleSection(header: ExpandableHeaderView, section: Int)
}

var sectionIsExpanded: Bool = false

class ExpandableHeaderView: UITableViewHeaderFooterView {
    
    private lazy var arrow: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: sectionIsExpanded ? "chevron.up" : "chevron.down")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return iv
    }()
    
    weak var delegate: ExpandableHeaderViewDelegate?
    var section: Int?
    
    func setup(withTitle title: String, section: Int, delegate: ExpandableHeaderViewDelegate) {
        self.delegate = delegate
        self.section = section
        self.textLabel?.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.textColor = .white
        contentView.backgroundColor = .darkGray
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addSubview(arrow)
        NSLayoutConstraint.activate([
            arrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            arrow.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrow.widthAnchor.constraint(equalToConstant: 20),
            arrow.heightAnchor.constraint(equalToConstant: 20),
        ])
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectHeaderAction(gesterRecognizer: UITapGestureRecognizer) {
        sectionIsExpanded.toggle()
        let cell = gesterRecognizer.view as! ExpandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section!)
    }
}
