//
//  LoadingHeader.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 21/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import Foundation
import UIKit

extension LoadingSectionHeaderView {
  struct Appearance {
    let labelColor = UIColor(red: 11/255, green: 31/255, blue: 52/255, alpha: 0.05)
    let labelInsets = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 0)
    let labelSize = CGSize(width: 70, height: 12)
  }
}

class LoadingSectionHeaderView: UITableViewHeaderFooterView {
  
  let appearance = Appearance()
  
  lazy var labelView: UIView = {
    let view = UIView()
    view.backgroundColor = self.appearance.labelColor
    view.setRadius(radius: self.appearance.labelSize.height / 2)
    
    return view
  }()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    
    setupSubviews()
    setupConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupSubviews() {
    self.addSubview(self.labelView)
  }
  
  func setupConstraints() {
    labelView.snp.makeConstraints { (make) in
      make.centerY.equalToSuperview()
      make.size.equalTo(appearance.labelSize)
      make.left.equalToSuperview().offset(appearance.labelInsets.left)
    }
  }
}
