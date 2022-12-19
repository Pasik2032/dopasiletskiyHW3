//
//  WelcomeModuleConfigurator.swift
//  PW2
//
//  Created Даниил Пасилецкий on 19.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class WelcomeModuleConfigurator {

  // MARK: - Configure

  func configure(
    output: WelcomeModuleOutput? = nil
  ) -> (
    view: WelcomeViewController,
    input: WelcomeModuleInput
  ) {
    let view = WelcomeViewController()
    let presenter = WelcomePresenter()
    let router = WelcomeRouter()

    presenter.view = view
    presenter.router = router
    presenter.output = output

    router.view = view

    view.output = presenter

    return (view, presenter)
  }
}

