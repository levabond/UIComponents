//
//  ESListSectionConfigurator.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 09/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit

protocol ESListSectionHeader {
  var title: String? { get }
  var view: UIView? { get }
}

protocol ESListSectionFooter {
  var title: String? { get }
  var view: UIView? { get }
}

protocol ESListSectionConfigurationProtocol {
  var identity: String { get }
  var configurationsCell: [ESListConfigurationCell] { get }
  var header: ESListSectionHeader? { get }
  var footer: ESListSectionFooter? { get }
}

struct ESListSectionConfiguration: ESListSectionConfigurationProtocol {
  var identity: String
  var configurationsCell: [ESListConfigurationCell]
  var header: ESListSectionHeader?
  var footer: ESListSectionFooter?
  
  init(identity: String, configurationsCell: [ESListConfigurationCell], header: ESListSectionHeader? = nil, footer: ESListSectionFooter? = nil) {
    self.identity = identity
    self.configurationsCell = configurationsCell
    self.header = header
    self.footer = footer
  }
  init(configurationsCell: [ESListConfigurationCell]) {
    self.init(identity: UUID().uuidString, configurationsCell: configurationsCell)
  }
}

