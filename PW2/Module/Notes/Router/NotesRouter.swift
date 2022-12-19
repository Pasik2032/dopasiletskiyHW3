//
//  NotesRouter.swift
//  dopasiletskiyPW4
//
//  Created Даниил Пасилецкий on 10.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol NotesRouterInput {
}

final class NotesRouter {

  // MARK: - Properties

  weak var view: UIViewController?
}

// MARK: - NotesRouterInput

extension NotesRouter: NotesRouterInput {
}

