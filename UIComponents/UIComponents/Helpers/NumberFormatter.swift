//
//  NumberFormatter.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 05/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//


import Foundation

class NumberFormatters {
  
  private static var currencyFormatter: NumberFormatter = {
    let numberFormatter: NumberFormatter = NumberFormatter()
    numberFormatter.currencySymbol = ""
    numberFormatter.numberStyle = NumberFormatter.Style.currency
    numberFormatter.maximumFractionDigits = 0
    numberFormatter.locale = NSLocale.current
    numberFormatter.currencyGroupingSeparator = String(numberFormatter.currencyGroupingSeparator.first ?? " ")
    
    return numberFormatter
  }()
  
  static func curencyFormatter(with string: String) -> String? {
    let onlyDigits = onlyDigit(for: string)
    let numberOrNil = Double(onlyDigits)
    guard let number = numberOrNil else { return nil }
    
    return (currencyFormatter.string(from: number as NSNumber) ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
  }
  
  static func onlyDigit(for string: String) -> String {
    return string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
  }
  
  static func getCurrentCurrencyGroupingSeparator() -> String {
    return currencyFormatter.currencyGroupingSeparator
  }
}
