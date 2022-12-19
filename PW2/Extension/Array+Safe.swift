//
//  Array+Safe.swift
//  PW2
//
//  Created by Даниил Пасилецкий on 19.12.2022.
//

import Foundation

extension Array {
  subscript(safe index: Int) -> Element? {
    return indices ~= index ? self[index] : nil
  }

  subscript(safe bounds: Range<Int>) -> ArraySlice<Element> {
    if bounds.lowerBound > count { return [] }
    let lower = Swift.max(0, bounds.lowerBound)
    let upper = Swift.max(0, Swift.min(count, bounds.upperBound))
    return self[lower..<upper]
  }

  subscript(safe lower: Int?, _ upper: Int?) -> ArraySlice<Element> {
    let lower = lower ?? 0
    let upper = upper ?? count
    if lower > upper { return [] }
    return self[safe: lower..<upper]
  }
}
