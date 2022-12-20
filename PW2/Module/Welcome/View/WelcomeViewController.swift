//
//  WelcomeViewController.swift
//  PW2
//
//  Created Даниил Пасилецкий on 19.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

protocol WelcomeViewInput: AnyObject {
  func setupValueText(_ text: String)
  func setupCommentText(_ text: String)
  func toggleColorPaletteView()
}

protocol WelcomeViewOutput: AnyObject {
  func incrementButtonPressed()
  func stackButtonPressed(model: WelcomeButtonModel)
}


final class WelcomeViewController: UIViewController {

  // MARK: - UI

  private lazy var commentLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14.0, weight: .regular)
    label.textColor = .systemGray
    label.numberOfLines = 0
    label.textAlignment = .center
    label.text = "start"
    return label
  }()

  private lazy var commentView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 12.0
    return view
  }()

  private lazy var valueLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 40.0, weight: .bold)
    label.textColor = .black
    label.text = "0"
    return label
  }()

  private lazy var incrementButton: UIButton = {
    let button = UIButton()
    button.setTitle("Increment", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.layer.cornerRadius = 12.0
    button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
    button.backgroundColor = .white
    button.dropShadow()
    button.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
    return button
  }()

  private lazy var colorPaletteView: ColorPaletteView = {
    let colorPaletteView = ColorPaletteView()
    colorPaletteView.isHidden = true
    colorPaletteView.addTarget(self, action: #selector(changeColor), for: .touchDragInside)
    return colorPaletteView
  }()

  private lazy var buttonsStackView: UIStackView = {

    func makeMenuButton(model: WelcomeButtonModel) -> UIButton {
      let button = UIButton()
      button.setTitle(model.title, for: .normal)
      button.tag = model.rawValue
      button.setTitleColor(.black, for: .normal)
      button.layer.cornerRadius = 12.0
      button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
      button.backgroundColor = .white
      button.snp.makeConstraints { $0.height.equalTo(button.snp.width) }
      button.addTarget(self, action: #selector(stackButtonPressed), for: .touchUpInside)
      return button
    }

    let stack = UIStackView(arrangedSubviews: buttons.map { makeMenuButton(model: $0) })
    stack.spacing = 12
    stack.axis = .horizontal
    stack.distribution = .fillEqually
    return stack
  }()

  // MARK: - Properties

  var output: WelcomeViewOutput?
  private let buttons: [WelcomeButtonModel] = [.palette, .notion, .news]

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  // MARK: - Actions

  @objc private func incrementButtonPressed() {
    let generator = UIImpactFeedbackGenerator(style: .light)
    generator.impactOccurred()
    output?.incrementButtonPressed()
  }

  @objc private func stackButtonPressed(sender: UIButton!) {
    let generator = UIImpactFeedbackGenerator(style: .light)
    generator.impactOccurred()
    guard let model = WelcomeButtonModel(rawValue: sender.tag) else { return }
    output?.stackButtonPressed(model: model)
  }

  @objc private func changeColor(_ slider: ColorPaletteView) {
    UIView.animate(withDuration: 0.5) {
      self.view.backgroundColor = slider.chosenColor
    }
  }

  // MARK: - Setup

  private func setupUI() {
    view.backgroundColor = .systemGray6
    view.addSubviews(
      [
        commentView,
        valueLabel,
        incrementButton,
        buttonsStackView,
        colorPaletteView,
      ]
    )
    commentView.addSubview(commentLabel)
    makeConstraints()
  }

  private func makeConstraints() {
    incrementButton.snp.makeConstraints {
      $0.height.equalTo(48)
      $0.centerY.equalToSuperview()
      $0.leading.trailing.equalToSuperview().inset(24)
    }
    valueLabel.snp.makeConstraints {
      $0.bottom.equalTo(incrementButton.snp.top).inset(-16)
      $0.centerX.equalToSuperview()
    }

    commentLabel.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(16)
    }

    commentView.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview().inset(24)
    }

    buttonsStackView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(24)
      $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
    }

    colorPaletteView.snp.makeConstraints {
      $0.top.equalTo(incrementButton.snp.bottom).inset(-8)
      $0.leading.trailing.equalToSuperview().inset(24)
      $0.bottom.equalTo(buttonsStackView.snp.top).inset(-8)
    }
  }
}

// MARK: - TroikaServiceViewInput

extension WelcomeViewController: WelcomeViewInput {
  func toggleColorPaletteView() {
    UIView.transition(
      with: colorPaletteView,
      duration: 0.4,
      options: .transitionCrossDissolve
    ) { [weak self] in
      self?.colorPaletteView.isHidden.toggle()
    }
  }

  func setupValueText(_ text: String) {
    UIView.transition(
      with: commentLabel,
      duration: 0.25,
      options: .transitionCrossDissolve
    ) { [weak self] in
      guard let self else { return }
      self.valueLabel.text = text
    }
  }

  func setupCommentText(_ text: String) {
    UIView.transition(
      with: commentLabel,
      duration: 0.25,
      options: .transitionCrossDissolve
    ) { [weak self] in
      guard let self else { return }
      self.commentLabel.text = text
    }
  }
}
