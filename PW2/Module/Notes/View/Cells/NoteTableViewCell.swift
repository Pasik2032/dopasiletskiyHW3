//
//  NoteTableViewCell.swift
//  dopasiletskiyPW4
//
//  Created by Даниил Пасилецкий on 11.10.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

  private lazy var label: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textColor = .black
    return label
  }()

  private lazy var backView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray6
    return view
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func config(with model: ShortNote) {
    label.text = model.text
  }

  private func setupUI() {
    contentView.addSubview(backView)
    backView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(16)
      make.top.bottom.equalToSuperview()
    }
    backView.addSubview(label)
    label.snp.makeConstraints { make in
      make.trailing.leading.top.bottom.equalToSuperview().inset(16)
    }
  }
}
