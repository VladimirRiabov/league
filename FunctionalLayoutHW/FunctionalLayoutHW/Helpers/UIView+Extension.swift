//
//  UIView+Extension.swift
//  FunctionalLayoutHW
//
//  Created by Владимир Рябов on 21.03.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
