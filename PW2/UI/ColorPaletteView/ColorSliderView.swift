//
//  ColorSliderView.swift
//  PW2
//
//  Created by Даниил Пасилецкий on 20.12.2022.
//

import UIKit

extension ColorPaletteView {
  final class ColorSliderView: UIControl {

    private let slider: UISlider = {
      let slider = UISlider()
      slider.addTarget(self, action: #selector(sliderMoved), for: .touchDragInside)
      return slider
    }()

    private let colorLabel = UILabel()

    private lazy var stackView: UIStackView = {
      let stackView = UIStackView(arrangedSubviews: [colorLabel, slider])
      stackView.axis = .horizontal
      stackView.spacing = 8
      return stackView
    }()

    private(set) var value: Float

    init(colorName: String, value: Float) {
      self.value = value
      super.init(frame: .zero)
      slider.value = value
      colorLabel.text = colorName
      setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    @objc private func sliderMoved(_ slider: UISlider) {
      self.value = slider.value
      sendActions(for: .touchDragInside)
    }

    private func setupUI() {
      addSubview(stackView)
      stackView.snp.makeConstraints {
        $0.edges.equalToSuperview().inset(12)
      }
    }
  }
}
