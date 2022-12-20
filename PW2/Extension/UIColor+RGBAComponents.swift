//
//  UIColor+RGBAComponents.swift
//  PW2
//
//  Created by Даниил Пасилецкий on 20.12.2022.
//

import UIKit

extension UIColor {

  var rgbaComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0

    getRed(&red, green: &green, blue: &blue, alpha: &alpha)

    return (red, green, blue, alpha)
  }

  var redComponent: Float {
    get { Float(rgbaComponents.red) }
  }

  var greenComponent: Float {
    get { Float(rgbaComponents.green) }
  }

  var blueComponent: Float {
    get { Float(rgbaComponents.blue) }
  }

  var alphaComponent: Float {
    get { Float(rgbaComponents.alpha) }
  }
}
