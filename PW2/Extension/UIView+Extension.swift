//
//  UIView+Extension.swift
//  PW2
//
//  Created by Даниил Пасилецкий on 19.12.2022.
//

import UIKit

extension UIView {
  func addSubviews(_ views: [UIView]) {
    views.forEach { addSubview($0) }
  }

  func dropShadow() {
    layer.shadowColor = UIColor.gray.cgColor
    layer.shadowOpacity = 0.3
    layer.shadowOffset = CGSize.zero
    layer.shadowRadius = 6
  }
}
