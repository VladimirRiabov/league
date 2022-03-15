//
//  CustomCell.swift
//  Expandable sections
//
//  Created by Владимир Рябов on 12.03.2022.
//

import UIKit

final class CustomCell: UITableViewCell {
    
    lazy var startRating: FiveStarRatingView = {
        let sr = FiveStarRatingView()
        sr.translatesAutoresizingMaskIntoConstraints = false
        return sr
    }()
    
    private lazy var albumImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = self.frame.height / 2.0
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.shadowOpacity = 0.5
        iv.layer.shadowRadius = 4
        iv.layer.shadowOffset = CGSize(width: 10, height: 10)
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private lazy var albumTitileLable: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Добавить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.layer.cornerRadius = 4
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(title: String, imageString: String) {
        albumTitileLable.text = title
        albumImageView.image = UIImage(named: imageString)
    }
}

extension CustomCell {
    private func initCell() {
        contentView.addSubview(albumImageView)
        contentView.addSubview(albumTitileLable)
        contentView.addSubview(startRating)
        contentView.addSubview(button)
        
        NSLayoutConstraint.activate([
            albumImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            albumImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            albumImageView.widthAnchor.constraint(equalToConstant: 100),
            albumImageView.heightAnchor.constraint(equalToConstant: 100),
            albumImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            
            albumTitileLable.topAnchor.constraint(equalTo: albumImageView.topAnchor),
            albumTitileLable.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 20),
            albumTitileLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            startRating.topAnchor.constraint(equalTo: albumTitileLable.bottomAnchor, constant: 20),
            startRating.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -20),
            startRating.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: albumTitileLable.bottomAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
