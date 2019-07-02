//
//  CalculateStringSize.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 02/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import Foundation

extension String {
  public func widthOfString(usingFont font: UIFont) -> CGFloat {
    let fontAttributes = [NSAttributedString.Key.font: font]
    let size = self.size(withAttributes: fontAttributes)
    return size.width
  }
  
  public func heightOfString(usingFont font: UIFont) -> CGFloat {
    let fontAttributes = [NSAttributedString.Key.font: font]
    let size = self.size(withAttributes: fontAttributes)
    return size.height
  }
  
  public func sizeOfString(usingFont font: UIFont) -> CGSize {
    let fontAttributes = [NSAttributedString.Key.font: font]
    return self.size(withAttributes: fontAttributes)
  }
  
  public func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
    let boundingBox = self.boundingRect(
      with: constraintRect,
      options: [.usesLineFragmentOrigin, .usesFontLeading],
      attributes: [NSAttributedString.Key.font: font],
      context: nil
    )
    return boundingBox.height
  }
}
