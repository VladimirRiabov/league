//
//  UIView+Extension.swift
//  URLSessionLesson10
//
//  Created by Владимир Рябов on 22.03.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
