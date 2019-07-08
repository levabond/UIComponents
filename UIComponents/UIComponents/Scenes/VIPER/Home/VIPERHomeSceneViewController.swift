//
//  VIPERHomeSceneViewController.swift
//  UIComponents
//
//  Created Лев Бондаренко on 28/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class VIPERHomeSceneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, VIPERHomeSceneViewProtocol {

	var presenter: VIPERHomeScenePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
    
    print("\(#function) --- section = \(indexPath.section), row = \(indexPath.row)")
    
    cell.textLabel?.text = "contacts[indexPath.row][0]"
    
    return cell
  }
}
