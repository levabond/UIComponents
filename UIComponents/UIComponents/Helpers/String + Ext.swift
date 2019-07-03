//
//  String + Ext.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 03/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import Foundation

extension String {
  func isEmail() -> Bool {
    let emailRegEx: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    
    return emailTest.evaluate(with: self)
  }
}
