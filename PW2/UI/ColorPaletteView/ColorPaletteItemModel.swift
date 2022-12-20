//
//  ColorPaletteItemModel.swift
//  PW2
//
//  Created by Даниил Пасилецкий on 20.12.2022.
//

import UIKit

enum ColorPaletteItemModel: Int {
  case red = 0
  case green = 1
  case blue = 2

  var title: String {
    get {
      switch self {
      case .red: return "R"
      case .green: return "G"
      case .blue: return "B"
      }
    }
  }
}
