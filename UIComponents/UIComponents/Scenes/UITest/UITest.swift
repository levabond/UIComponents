//
//  UITest.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 01/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit
import SnapKit

class UITestController: UIViewController {
  
  lazy var stackView: UIStackView = {
    let stackview = UIStackView()
    stackview.backgroundColor = .red
    stackview.addSubview(label)
    stackview.addSubview(label2)
    
    
    return stackview
  }()
  
  lazy var label: UILabel = {
    let label = UILabel()
    label.text = "terwerwrwerwesafkasfsafsa;fksakfjsafksakfjsafksakfjsafksakfjsafksakfjsafksakfjsafksakfjsafksakfjsafksakfjsafksakfjsafksakfjsafksakfjsafksakfjsa;f;saf;as"
    label.numberOfLines = 0
    
    return label
  }()
  
  lazy var label2: UILabel = {
    let label = UILabel()
    label.text = "test"
    label.numberOfLines = 0
    
    return label
  }()
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    view.addSubview(stackView)
  }
  
  func setupConstraints() {
    stackView.snp.makeConstraints { make in
      make.left.right.equalTo(view)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
}
