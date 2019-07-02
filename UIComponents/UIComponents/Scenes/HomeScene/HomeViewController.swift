//  
//  HomeViewController.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 22/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit

final class HomeViewController: UITableViewController {
    
  var model: HomeModelInput!
  lazy var contentView: HomeViewInput = { return view as! HomeViewInput }()
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 15
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "test")
    
    cell.textLabel?.text = "test"
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    present(UITestController(), animated: true, completion: nil)
  }
}

// MARK: - HomeModelOutput
extension HomeViewController: HomeModelOutput {}

// MARK: - HomeViewControllerInput
extension HomeViewController: HomeViewControllerInput {}
