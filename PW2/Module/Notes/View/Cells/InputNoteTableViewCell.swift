//
//  InputNoteTableViewCell.swift
//  dopasiletskiyPW4
//
//  Created by Даниил Пасилецкий on 10.10.2022.
//

import UIKit

protocol InputNoteDelegate {
  func addNote(_ text: String)
}

class InputNoteTableViewCell: UITableViewCell {

  private var showPlaceholder = true {
    didSet {
      textView.textColor = showPlaceholder ? .tertiaryLabel : .black
      textView.text = showPlaceholder ? "Type smth" : nil
    }
  }
  var delegate: InputNoteDelegate?

  private lazy var textView: UITextView  = {
    let textView = UITextView()
    textView.font = .systemFont(ofSize: 14, weight: .regular)
    textView.backgroundColor = .clear
    textView.delegate = self
    textView.textColor = .tertiaryLabel
    textView.text = "Type smth"
    return textView
  }()

  private lazy var addButton: UIButton = {
    let button = UIButton()
    button.setTitle("Add new note", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    button.setTitleColor(.systemBackground, for: .normal)
    button.backgroundColor = .black
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    button.isEnabled = false
    button.alpha = 0.5
    return button
  }()

  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [textView, addButton])
    stackView.axis = .vertical
    stackView.spacing = 8
    stackView.distribution = .fill
    stackView.backgroundColor = .systemGray6
    stackView.layer.cornerRadius = 10.0
    stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    stackView.isLayoutMarginsRelativeArrangement = true
    return stackView
  }()


  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc private func addButtonTapped() {
    delegate?.addNote(textView.text)
    endEditing(true)
    showPlaceholder = true
    addButton.isEnabled = false
    addButton.alpha = 0.5
  }

  private func setupUI() {
    contentView.addSubview(stackView)
    selectionStyle = .none
    backgroundColor = .white
    stackView.snp.makeConstraints { make in
      make.top.bottom.leading.trailing.equalToSuperview().inset(16)
    }
    addButton.snp.makeConstraints { make in
      make.height.equalTo(44)
    }
    textView.snp.makeConstraints { make in
      make.height.equalTo(140)
    }
  }

  private func setButton(_ isActive: Bool) {
    addButton.isEnabled = isActive
    addButton.alpha = isActive ? 1 : 0.5
  }
}

extension InputNoteTableViewCell: UITextViewDelegate {
  func textViewDidBeginEditing(_ textView: UITextView) {
    showPlaceholder = false
  }

  func textViewDidChange(_ textView: UITextView) {
    setButton(textView.text != nil && !textView.text.isEmpty)
  }
}
