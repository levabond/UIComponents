//
//  PhoneNumberFormatter.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 05/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import PhoneNumberKit

class PhoneHelper {
  static func getBeautyPhone(with phone: String) -> String {
    var formattedPhone = phone
    let phoneNumberKit: PhoneNumberKit = PhoneNumberKit()
    do {
      if formattedPhone.first == "8" {
        formattedPhone = String(formattedPhone.dropFirst())
        formattedPhone = "+7" + phone
      }
      let parsedPhone = try phoneNumberKit.parse(formattedPhone)
      formattedPhone = phoneNumberKit.format(parsedPhone, toType: .international)
    } catch {
      print("parse err")
    }
    
    return formattedPhone
  }
}
