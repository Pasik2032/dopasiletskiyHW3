//
//  WelcomeRouter.swift
//  PW2
//
//  Created Даниил Пасилецкий on 19.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol WelcomeRouterInput {
  func showNoties()
}

final class WelcomeRouter {

  // MARK: - Properties

  weak var view: UIViewController?
}

// MARK: - WelcomeRouterInput

extension WelcomeRouter: WelcomeRouterInput {
  func showNoties() {
    let module = NotesModuleConfigurator().configure()
    view?.present(module.view, animated: true)
  }
}

