//
//  NotesPresenter.swift
//  dopasiletskiyPW4
//
//  Created Даниил Пасилецкий on 10.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol NotesModuleInput: AnyObject {
}

protocol NotesModuleOutput: AnyObject {

}

final class NotesPresenter {

  // MARK: - Properties

  weak var view: NotesViewInput?
  var router: NotesRouterInput?
  weak var output: NotesModuleOutput?

  private var noties: [ShortNote] = [] {
    didSet {
      view?.setupNotes(noties)
    }
  }
}

// MARK: - NotesViewOutput

extension NotesPresenter: NotesViewOutput {
  func addNote(_ text: String) {
    noties.append(ShortNote(text: text))
  }

  func viewDidLoad() {

  }
}

// MARK: - NotesInput

extension NotesPresenter: NotesModuleInput {
}
