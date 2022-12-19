//
//  NotesViewController.swift
//  dopasiletskiyPW4
//
//  Created Даниил Пасилецкий on 10.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

protocol NotesViewInput: AnyObject {
  func setupNotes(_ notes: [ShortNote])
}

protocol NotesViewOutput: InputNoteDelegate {
  func viewDidLoad()
}


final class NotesViewController: UIViewController {

  // MARK: - UI

  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 600
    tableView.backgroundColor = .white
    tableView.separatorStyle = .none
    return tableView
  }()


  // MARK: - Properties

  var output: NotesViewOutput?

  private let sections: [NoteSection] = [.input, .notes]

  private var notes: [ShortNote] = []

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    output?.viewDidLoad()

  }

  // MARK: - Setup

  private func setupUI() {
    view.backgroundColor = .white
    view = tableView
  }
}

// MARK: - TroikaServiceViewInput

extension NotesViewController: NotesViewInput {
  func setupNotes(_ notes: [ShortNote]) {
    self.notes = notes
    tableView.reloadData()
  }
}

extension NotesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = UITableViewCell()
    guard let section = sections[safe: indexPath.section] else { return cell }
    switch section {
    case .input:
      let inputCell = tableView.dequeueReusableCellWithRegistration(
        type: InputNoteTableViewCell.self,
        indexPath: indexPath
      )
      inputCell.delegate = output
      cell = inputCell
    case .notes:
      let noteCell = tableView.dequeueReusableCellWithRegistration(
        type: NoteTableViewCell.self,
        indexPath: indexPath
      )
      if let note = notes[safe: indexPath.row] {
        noteCell.config(with: note)
      }
      cell = noteCell
    }
    return cell
  }


  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let section = sections[safe: section] else { return 0 }
    switch section {
    case .input: return 1
    case .notes: return notes.count
    }
  }
}

extension NotesViewController: UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    sections.count
  }
}
