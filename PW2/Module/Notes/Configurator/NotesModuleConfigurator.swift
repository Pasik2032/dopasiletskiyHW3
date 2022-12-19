//
//  NotesModuleConfigurator.swift
//  dopasiletskiyPW4
//
//  Created Даниил Пасилецкий on 10.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class NotesModuleConfigurator {

  // MARK: - Configure

  func configure(
    output: NotesModuleOutput? = nil
  ) -> (
    view: NotesViewController,
    input: NotesModuleInput
  ) {
    let view = NotesViewController()
    let presenter = NotesPresenter()
    let router = NotesRouter()

    presenter.view = view
    presenter.router = router
    presenter.output = output

    router.view = view

    view.output = presenter

    return (view, presenter)
  }
}

