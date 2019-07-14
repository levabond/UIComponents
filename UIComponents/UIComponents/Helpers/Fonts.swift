//
//  Fonts.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 29/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
  struct SharedTextStyles {
    static var title1: UIFont {
      return UIFont.systemFont(ofSize: 34.0, weight: .bold)
    }
    
    static var title2: UIFont {
      return UIFont.systemFont(ofSize: 28.0, weight: .bold)
    }
    
    static var title3: UIFont {
      return UIFont.systemFont(ofSize: 22.0, weight: .bold)
    }
    
    static var title4: UIFont {
      return UIFont.systemFont(ofSize: 20.0, weight: .bold)
    }
    
    static var headline: UIFont {
      return UIFont.systemFont(ofSize: 17.0, weight: .semibold)
    }
    
    static var body: UIFont {
      return UIFont.systemFont(ofSize: 17.0, weight: .regular)
    }
    
    static var callout: UIFont {
      return UIFont.systemFont(ofSize: 16.0, weight: .regular)
    }
    
    static var calloutBold: UIFont {
      return UIFont.systemFont(ofSize: 16.0, weight: .bold)
    }
    
    static var subhead: UIFont {
      return UIFont.systemFont(ofSize: 15.0, weight: .regular)
    }
    
    static var subheadSemibold: UIFont {
      return UIFont.systemFont(ofSize: 15.0, weight: .semibold)
    }
    
    static var subheadBold: UIFont {
      return UIFont.systemFont(ofSize: 15.0, weight: .bold)
    }
    
    static var footnote: UIFont {
      return UIFont.systemFont(ofSize: 13.0, weight: .regular)
    }
    
    static var caption1: UIFont {
      return UIFont.systemFont(ofSize: 12.0, weight: .regular)
    }
    
    static var caption2: UIFont {
      return UIFont.systemFont(ofSize: 11.0, weight: .regular)
    }
    
    static var cardCaption: UIFont {
      return UIFont.systemFont(ofSize: 11.0, weight: .semibold)
    }
    
    static var segmentedControl: UIFont {
      return UIFont.systemFont(ofSize: 15.0, weight: .medium)
    }
    
    static var journalCategories: UIFont {
      return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
    }
  }
}

extension UIFont {
  static var title1: UIFont {
    return UIFont.makeFont(size: 34, face: "Bold")
  }
  
  static var title2: UIFont {
    return UIFont.makeFont(size: 28, face: "Bold")
  }
  
  static var title3: UIFont {
    return UIFont.makeFont(size: 22, face: "Bold")
  }
  
  static var title4: UIFont {
    return UIFont.makeFont(size: 20, face: "Bold")
  }
  
  static var headline: UIFont {
    return UIFont.makeFont(style: .headline, face: "Semibold")
  }
  
  static var body: UIFont {
    if #available(iOS 9.0, *) {
      return UIFont.makeFont(style: .callout, face: "Regular")
    } else {
      return UIFont.makeFont(style: .body, face: "Regular")
    }
  }
  
  static var bodySemibold: UIFont {
    if #available(iOS 9.0, *) {
      return UIFont.makeFont(style: .callout, face: "Semibold")
    } else {
      return UIFont.makeFont(style: .body, face: "Semibold")
    }
  }
  
  static var bodyMedium: UIFont {
    if #available(iOS 9.0, *) {
      return UIFont.makeFont(style: .callout, face: "Medium")
    } else {
      return UIFont.makeFont(style: .body, face: "Medium")
    }
  }
  
  static var callout: UIFont {
    return UIFont.makeFont(style: .callout, face: "Regular")
  }
  
  static var subhead: UIFont {
    return UIFont.makeFont(size: 15, face: "Regular")
  }
  
  static var subheadBold: UIFont {
    return UIFont.makeFont(size: 15, face: "Bold")
  }
  
  static var footnote: UIFont {
    return UIFont.makeFont(size: 13, face: "Regular")
  }
  
  static var caption1: UIFont {
    return UIFont.makeFont(size: 12, face: "Regular")
  }
  
  static var caption2: UIFont {
    return UIFont.makeFont(size: 11, face: "Regular")
  }
  
  static var dynamicCaption1: UIFont {
    return UIFont.makeFont(style: .footnote, face: "Regular")
  }
  
  static var segmentedControl: UIFont {
    return UIFont.makeFont(size: 15, face: "Medium")
  }
  
  private static func makeFont(style: UIFont.TextStyle, face: String) -> UIFont {
    var descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
    let size = descriptor.fontAttributes[UIFontDescriptor.AttributeName.size] as? Float ?? 0
    descriptor = UIFontDescriptor()
    let font = UIFont.systemFont(ofSize: CGFloat(size))
    descriptor = descriptor.withFamily(font.familyName)
    descriptor = descriptor.withSize(CGFloat(size))
    descriptor = descriptor.withFace(face)
    return UIFont(descriptor: descriptor, size: 0)
  }
  
  private static func makeFont(size: CGFloat, face: String) -> UIFont {
    var descriptor = UIFontDescriptor()
    let font = UIFont.systemFont(ofSize: size)
    descriptor = descriptor.withFamily(font.familyName)
    descriptor = descriptor.withSize(CGFloat(size))
    descriptor = descriptor.withFace(face)
    return UIFont(descriptor: descriptor, size: 0)
  }
}

extension UIFont {
  //  static let display = lightSystemFont(ofSize: 32)
  //  static let title = lightSystemFont(ofSize: 19)
  //  static let subhead1 = semiboldSystemFont(ofSize: 13)
  //  static let subhead2 = systemFont(ofSize: 12)
  //  static let body1 = lightSystemFont(ofSize: 16)
  //  static let body2 = lightSystemFont(ofSize: 14)
  //  static let caption = lightSystemFont(ofSize: 12)
  //  static let button = systemFont(ofSize: 14)
  //  static let secondaryButton = mediumSystemFont(ofSize: 12)
  //  static let legal = systemFont(ofSize: 11)
}

// MARK: - Kern sizes
extension UIFont {
  enum Kern {
    static let s = 0.4
    static let m = 0.8
    static let l = 1.2
  }
}

extension UIFont {
  static func lightSystemFont(ofSize fontSize: CGFloat) -> UIFont {
    let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
    let lightFontDescriptor = fontDescriptor.withFace("Light")
    return UIFont(descriptor: lightFontDescriptor, size: fontSize)
  }
  
  static func semiboldSystemFont(ofSize fontSize: CGFloat) -> UIFont {
    let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
    let lightFontDescriptor = fontDescriptor.withFace("Semibold")
    return UIFont(descriptor: lightFontDescriptor, size: fontSize)
  }
  
  static func mediumSystemFont(ofSize fontSize: CGFloat) -> UIFont {
    let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
    let lightFontDescriptor = fontDescriptor.withFace("Medium")
    return UIFont(descriptor: lightFontDescriptor, size: fontSize)
  }
}

extension UIColor {
  struct SharedColorStyles {
    // MARK: Default Color
    @nonobjc static var accentIOS: UIColor {
      return UIColor(red: 0.0 / 255.0, green: 122.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var dividerBG: UIColor {
      return UIColor(red: 200.0 / 255.0, green: 199.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var screenBG: UIColor {
      return UIColor(red: 239.0 / 255.0, green: 239.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var accent: UIColor {
      return UIColor(red: 97.0 / 255.0, green: 189.0 / 255.0, blue: 79.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var accent300: UIColor {
      return UIColor(red: 0.38, green: 0.74, blue: 0.31, alpha: 1.0)
    }
    
    @nonobjc static var accent500: UIColor {
      return UIColor(red: 172.0 / 255.0, green: 213.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var lightAccent: UIColor {
      return UIColor(red: 153.0 / 255.0, green: 209.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var star: UIColor {
      return UIColor(red: 1.0, green: 204.0 / 255.0, blue: 0.0, alpha: 1.0)
    }
    
    @nonobjc static var warningText: UIColor {
      return UIColor(red: 1.0, green: 149.0 / 255.0, blue: 0.0, alpha: 1.0)
    }
    
    @nonobjc static var successText: UIColor {
      return UIColor(red: 76.0 / 255.0, green: 217.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var errorText: UIColor {
      return UIColor(red: 1.0, green: 59.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var secondaryText: UIColor {
      return UIColor(white: 102.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var caption: UIColor {
      return UIColor(red: 138.0 / 255.0, green: 138.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var mainText: UIColor {
      return UIColor(white: 0.0, alpha: 1.0)
    }
    
    @nonobjc static var dividerLine: UIColor {
      return UIColor(red: 200.0 / 255.0, green: 199.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var screenBackground: UIColor {
      return UIColor(red: 239.0 / 255.0, green: 239.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var secondaryAccent: UIColor {
      return UIColor(red: 235.0 / 255.0, green: 90.0 / 255.0, blue: 70.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var tabBarIcon: UIColor {
      return UIColor(red: 149.0 / 255.0, green: 159.0 / 255.0, blue: 173.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var dividerColor: UIColor {
      return UIColor(red: 188.0 / 255.0, green: 187.0 / 255.0, blue: 193.0 / 255.0, alpha: 1.0)
    }
    
    // MARK: Grid Legend markers colors
    
    @nonobjc static var oneRoom: UIColor {
      return UIColor(red: 90.0 / 255.0, green: 172.0 / 255.0, blue: 68.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var twoRooms: UIColor {
      return UIColor(red: 188.0 / 255.0, green: 96.0 / 255.0, blue: 158.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var threeRoom: UIColor {
      return UIColor(red: 0.0 / 255.0, green: 122.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var fourPlusRooms: UIColor {
      return UIColor(red: 195.0 / 255.0, green: 119.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var fromEstateInvestor: UIColor {
      return UIColor(red: 255.0 / 255.0, green: 149.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var withDoscount: UIColor {
      return UIColor(red: 220.0 / 255.0, green: 100.0 / 255.0, blue: 84.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var notMatchFilter: UIColor {
      return UIColor(red: 200.0 / 255.0, green: 199.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var activityIndicatorColor: UIColor {
      return UIColor(red: 90.0 / 255.0, green: 172.0 / 255.0, blue: 68.0 / 255.0, alpha: 1.0)
    }
    
    // MARK: Social Network Colors
    
    @nonobjc static var inputBackground: UIColor {
      return UIColor(red: 142.0 / 255.0, green: 142.0 / 255.0, blue: 147.0 / 255.0, alpha: 0.24)
    }
    
    @nonobjc static var inputText: UIColor {
      return UIColor(red: 142.0 / 255.0, green: 142.0 / 255.0, blue: 147.0 / 255.0, alpha: 1.0)
    }
    // ¯\_(ツ)_/¯
    @nonobjc static var citySelectionBackground: UIColor {
      return UIColor(red: 249.0 / 255.0, green: 249.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var topBarBg: UIColor {
      return UIColor(red: 249.0 / 255.0, green: 249.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var facebook: UIColor {
      return UIColor(red: 59.0 / 255.0, green: 89.0 / 255.0, blue: 152.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var google: UIColor {
      return UIColor(red: 220.0 / 255.0, green: 78.0 / 255.0, blue: 65.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var vk: UIColor {
      return UIColor(red: 77.0 / 255.0, green: 118.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var odnoklassniki: UIColor {
      return UIColor(red: 255.0 / 255.0, green: 152.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var overlay: UIColor {
      return UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 0.12)
    }
    
    // MARK: - View Backgroung Color
    
    @nonobjc static var viewLightBlue: UIColor {
      return UIColor(red: 143.0 / 255.0, green: 223.0 / 255.0, blue: 235.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var viewBlue: UIColor {
      return UIColor(red: 139.0 / 255.0, green: 189.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var viewLightOrange: UIColor {
      return UIColor(red: 250.0 / 255.0, green: 216.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var viewPink: UIColor {
      return UIColor(red: 239.0 / 255.0, green: 179.0 / 255.0, blue: 171.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var viewLightYellow: UIColor {
      return UIColor(red: 245.0 / 255.0, green: 234.0 / 255.0, blue: 146.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var viewLightViolet: UIColor {
      return UIColor(red: 223.0 / 255.0, green: 192.0 / 255.0, blue: 235.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var viewLightPink: UIColor {
      return UIColor(red: 250.0 / 255.0, green: 198.0 / 255.0, blue: 229.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var viewLightGreen: UIColor {
      return UIColor(red: 179.0 / 255.0, green: 241.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var viewGreen: UIColor {
      return UIColor(red: 183.0 / 255.0, green: 221.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc static var skeleton: UIColor {
      return UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 0.07)
    }
    
  }
}


