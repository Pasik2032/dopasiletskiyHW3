//
//  ColorPaletteView.swift
//  PW2
//
//  Created by Даниил Пасилецкий on 20.12.2022.
//

import UIKit

final class ColorPaletteView: UIControl {

  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: configColorSligerView())
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.backgroundColor = .white
    stackView.layer.cornerRadius = 12.0
    return stackView
  }()

  private func configColorSligerView() -> [ColorSliderView] {
    items.map { model in
      var value: Float
      switch model {
      case .red: value = chosenColor.redComponent
      case .green: value = chosenColor.greenComponent
      case .blue: value = chosenColor.blueComponent
      }
      let colorSliderView = ColorSliderView(colorName: model.title, value: value)
      colorSliderView.tag = model.rawValue
      colorSliderView.addTarget(self, action: #selector(sliderMoved), for: .touchDragInside)
      return colorSliderView
    }
  }

  private(set) var chosenColor: UIColor = .systemGray6
  private let items: [ColorPaletteItemModel] = [.red, .green, .blue]

  init() {
    super.init(frame: .zero)
    setupUI()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc private func sliderMoved(slider: ColorSliderView) {
    guard let model = ColorPaletteItemModel(rawValue: slider.tag) else { return }
    switch model {
    case .red:
      self.chosenColor = UIColor(
        red: CGFloat(slider.value),
        green: CGFloat(chosenColor.greenComponent),
        blue: CGFloat(chosenColor.blueComponent),
        alpha: CGFloat(chosenColor.alphaComponent)
      )
    case .green:
      self.chosenColor = UIColor(
        red: CGFloat(chosenColor.redComponent),
        green: CGFloat(slider.value),
        blue: CGFloat(chosenColor.blueComponent),
        alpha: CGFloat(chosenColor.alphaComponent)
      )
    case .blue:
      self.chosenColor = UIColor(
        red: CGFloat(chosenColor.redComponent),
        green: CGFloat(chosenColor.blueComponent),
        blue: CGFloat(slider.value),
        alpha: CGFloat(chosenColor.alphaComponent)
      )
    }
    sendActions(for: .touchDragInside)
  }

  private func setupUI() {
    addSubview(stackView)
    stackView.snp.makeConstraints { $0.edges.equalToSuperview() }
  }
}


