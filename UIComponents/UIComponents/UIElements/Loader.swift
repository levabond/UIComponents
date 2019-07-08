//
//  Loader.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 08/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit

class Loader: UIView {
  
  // MARK: - UI Elements
  
  let activityView = UIActivityIndicatorView(style: .gray)
  
  // MARK: - Lifecycle View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    alpha = 0.7
    isHidden = true
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.setupConstraints()
  }
  
  // MARK: - Setup func
  
  private func setupViews() {
    addSubview(activityView)
    
    activityView.color = .gray
    activityView.startAnimating()
  }
  
  private func setupConstraints() {
    snp.makeConstraints { make in
      make.width.equalTo(UIScreen.main.bounds.width)
      make.height.equalTo(UIScreen.main.bounds.height)
    }
    
    activityView.snp.makeConstraints { make in
      make.height.width.equalTo(40.0)
      make.center.equalToSuperview()
    }
  }
}

