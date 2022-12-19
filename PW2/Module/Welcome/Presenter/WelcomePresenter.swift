//
//  WelcomePresenter.swift
//  PW2
//
//  Created Даниил Пасилецкий on 19.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol WelcomeModuleInput: AnyObject {

}

protocol WelcomeModuleOutput: AnyObject {

}

final class WelcomePresenter {

  // MARK: - Properties

  weak var view: WelcomeViewInput?
  var router: WelcomeRouterInput?
  weak var output: WelcomeModuleOutput?

  private var value: Int = 0 {
    didSet {
      view?.setupValueText(String(value))
      view?.setupCommentText(commentText)
    }
  }

  private var commentText: String {
    get {
      switch value {
      case 0...10: return "1"
      case 10...20: return "2"
      case 20...30: return "3"
      case 30...40: return "4"
      case 40...50: return "🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉"
      case 50...60: return "big boy"
      case 60...70: return "70 70 70 moreeeee"
      case 70...80: return "⭐⭐⭐⭐⭐⭐⭐⭐⭐"
      case 80...90: return "80+\n go higher!"
      case 90...100: return "100!! to the moon!!"
      default: return "🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️"
      }
    }
  }
}

// MARK: - WelcomeViewOutput

extension WelcomePresenter: WelcomeViewOutput {
  func stackButtonPressed(model: WelcomeButtonModel) {
    switch model {
    case .palette, .news: break
    case .notion: router?.showNoties()
    }
  }

  func incrementButtonPressed() {
    value += 1
  }
}

// MARK: - WelcomeInput

extension WelcomePresenter: WelcomeModuleInput {

}
