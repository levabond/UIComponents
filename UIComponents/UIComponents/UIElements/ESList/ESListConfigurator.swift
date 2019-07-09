//
//  ESListConfigurator.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 09/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import Foundation
import RxDataSources
import RxSwift
import RxCocoa

struct ESListConfiguration {
  var sections: Driver<[ESListSectionConfigurationProtocol]>
  var configurationUI: ESListConfigurationUI
  var animation: UITableView.RowAnimation
  init(
    sections: Driver<[ESListSectionConfigurationProtocol]>,
    configurationUI: ESListConfigurationUI = ESListConfigurationUI(),
    animation: UITableView.RowAnimation = .none
    ) {
    self.sections = sections
    self.configurationUI = configurationUI
    self.animation = animation
  }
}

class ESListConfigurationItem: IdentifiableType, Equatable {
  typealias Identity = String
  var identity: Identity {
    return configuration.identity
  }
  weak var configuration: ESListConfigurationCell!
  
  init(configuration: ESListConfigurationCell) {
    self.configuration = configuration
  }
  
  static func == (lhs: ESListConfigurationItem, rhs: ESListConfigurationItem) -> Bool {
    return lhs.identity == rhs.identity
  }
}

protocol ESListConfigurationCell: class {
  var identity: String { get }
  var itemSelected: PublishRelay<Void> { get }
  var cell: ESListConfigureViewCell { get }
  func unsubscribe()
  
}

protocol ESListConfigureViewCell: class {
  var height: BehaviorRelay<CGFloat> { get }
  func configuration(config: ESListConfigurationCell)
}

struct ESListConfigurationUI {
  
}

