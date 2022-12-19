//
//  UITableView+Extension.swift
//  dopasiletskiyPW4
//
//  Created by Даниил Пасилецкий on 10.10.2022.
//

import Foundation
import UIKit

extension UITableView {

  static func defaultReuseId(for elementType: UIView.Type) -> String {
    return String(describing: elementType)
  }

  func dequeueReusableHeaderFooterWithRegistration<T: UITableViewHeaderFooterView>(type: T.Type, reuseId: String? = nil) -> T {
    let normalizedReuseId = reuseId ?? UITableView.defaultReuseId(for: T.self)

    if let view = dequeueReusableHeaderFooterView(withIdentifier: normalizedReuseId) as? T {
      return view
    }

    register(type, forHeaderFooterViewReuseIdentifier: normalizedReuseId)
    return dequeueReusableHeaderFooterView(withIdentifier: normalizedReuseId) as! T
  }

  func dequeueReusableCellWithRegistration<T: UITableViewCell>(type: T.Type, indexPath: IndexPath, reuseId: String? = nil) -> T {
    let normalizedReuseId = reuseId ?? UITableView.defaultReuseId(for: T.self)

    if let cell = dequeueReusableCell(withIdentifier: normalizedReuseId) as? T {
      return cell
    }

    // Please note, the documentation states that ofType: should be the extension of the file.
    // However even if you are using .xib you need to pass `@"nib" or you will get a false-negative.

    if Bundle.main.path(forResource: normalizedReuseId, ofType: "nib") != nil {
      register(UINib(nibName: normalizedReuseId, bundle: nil), forCellReuseIdentifier: normalizedReuseId)
    } else {
      register(type, forCellReuseIdentifier: normalizedReuseId)
    }

    return dequeueReusableCell(withIdentifier: normalizedReuseId, for: indexPath) as! T
  }
}
