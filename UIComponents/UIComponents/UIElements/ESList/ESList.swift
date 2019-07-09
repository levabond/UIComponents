//
//  ESList.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 09/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

struct ESListSection {
  var identifier: String
  var header: ESListSectionHeader?
  var footer: ESListSectionFooter?
  var items: [Item]
}

extension ESListSection: AnimatableSectionModelType {
  typealias Identity = String
  typealias Item = ESListConfigurationItem
  var identity: String {
    return identifier
  }
  init(original: ESListSection, items: [Item]) {
    self = original
    self.items = items
  }
}

//swiftlint:disable all

class ESList: UIView {
  private let disposeBag = DisposeBag()
  let tableView = UITableView()
  
  // swiftlint:disable:next all
  func configuration(config: ESListConfiguration) {
    let tableView = self.tableView
    tableView.separatorStyle = .none
    tableView.estimatedRowHeight = UITableView.automaticDimension
    tableView.rowHeight = 0
    tableView.rx
      .setDelegate(self)
      .disposed(by: disposeBag)
    addSubview(tableView)
    tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    config.sections
      .asDriver(onErrorJustReturn: [])
      .drive(onNext: { sections in
        for section in sections {
          for cell in section.configurationsCell {
            if let cell = cell.cell as? UITableViewCell {
              tableView.register(
                cell.classForCoder,
                forCellReuseIdentifier: String(describing: cell)
              )
            }
          }
        }
      })
      .disposed(by: disposeBag)
    
    let dataSource = RxTableViewSectionedAnimatedDataSource<ESListSection>(configureCell: { _, tableView, _, item -> UITableViewCell in
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: item.configuration.cell)) ?? UITableViewCell()
      (cell as? ESListConfigureViewCell)?.configuration(config: item.configuration)
      return cell
    })
    let animation = AnimationConfiguration(insertAnimation: config.animation, reloadAnimation: config.animation, deleteAnimation: config.animation)
    dataSource.animationConfiguration = animation
    config.sections
      .map {
        $0.map {
          ESListSection(
            identifier: $0.identity,
            header: $0.header,
            footer: $0.footer,
            items: $0.configurationsCell.map { ESListConfigurationItem(configuration: $0) }
          )
        }
      }
      .drive(tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
    tableView.rx.itemSelected
      .asDriver()
      .withLatestFrom(config.sections) { indexPath, sections in
        sections[indexPath.section].configurationsCell[indexPath.row]
      }
      .drive(onNext: { cell in
        cell.itemSelected.accept(())
      })
      .disposed(by: disposeBag)
    tableView.tableFooterView = UIView()
  }
}

private extension Reactive where Base: UITableView {
  var reloadCell: Binder<(IndexPath, UITableView.RowAnimation)> {
    return Binder<(IndexPath, UITableView.RowAnimation)>(base) { base, updateRowData in
      let (indexPath, rowAnimation) = updateRowData
      base.reloadRows(at: [indexPath], with: rowAnimation)
    }
  }
}

extension ESList: UITableViewDelegate {
  public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if let viewCell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) as? ESListConfigureViewCell {
      return viewCell.height.value
    }
    return UITableView.automaticDimension
  }
}

