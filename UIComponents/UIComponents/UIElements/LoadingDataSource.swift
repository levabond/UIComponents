//
//  LoadingDataSource.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 18/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit
import ESDomain

extension FavoriteTableDelegate {
  struct Appearance {
    var heightForSectionHeader: CGFloat = 44
  }
}

class FavoriteTableDelegate: SearchTabTableViewDelegate {
  let appearance: Appearance
  var representableViewModels: [FavoriteScene.FetchFavorite.ViewModel.DisplayedObject]
  var routingModel: [ObjectModel] = []
  weak var vcDelegate: EstateListViewControllerDelegate?
  var paginator: Paginator?
  var countObject: Int = 0
  
  init(viewModels: [FavoriteScene.FetchFavorite.ViewModel.DisplayedObject] = [], appearance: Appearance = Appearance()) {
    self.appearance = appearance
    representableViewModels = viewModels
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return appearance.heightForSectionHeader
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterWithRegistration(type: FavoriteListHeader.self)
    header.setHeader(withCount: countObject)
    
    return header
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 380.0
  }
}

// MARK: - ObjectTable data source

class FavoriteTableDataSource: NSObject, UITableViewDataSource {
  var representableViewModels: [FavoriteScene.FetchFavorite.ViewModel.DisplayedObject]
  weak var vcDelegate: EstateListViewControllerDelegate?
  var countObject: Int = 0
  
  init(viewModels: [FavoriteScene.FetchFavorite.ViewModel.DisplayedObject] = []) {
    representableViewModels = viewModels
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.representableViewModels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithRegistration(type: FavoriteObjectCell.self, indexPath: indexPath)
    guard let viewModel = representableViewModels[safe: indexPath.row] else { return cell }
    
    viewModel.oldPrice.isEmpty ? cell.hideOldPrice() : cell.showOldPrice()
    viewModel.rating == "0" ? cell.hideRating() : cell.showRating()
    cell.setCell(withModel: viewModel)
    cell.setPhotos(with: viewModel.photoURLs)
    cell.vcDelegate = self.vcDelegate
    cell.indexPath = indexPath
    
    return cell
  }
}

