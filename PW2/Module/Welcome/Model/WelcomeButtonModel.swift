//
//  WelcomeButtonModel.swift
//  PW2
//
//  Created by Даниил Пасилецкий on 19.12.2022.
//

import UIKit

enum WelcomeButtonModel: Int {
  case palette = 0
  case news = 1
  case notion = 2

  var title: String {
    switch self {
    case .palette: return "🎨"
    case .notion: return "📝"
    case .news: return "📰"
    }
  }
}
