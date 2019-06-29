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

