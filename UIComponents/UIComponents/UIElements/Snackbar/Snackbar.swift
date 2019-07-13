//
//  Snackbar.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 12/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit

extension Snackbar {
  struct Appearance {
    let heightBlock: CGFloat = 24.0
    let offset: CGFloat = 16.0
  }
}

class Snackbar: UIView {
  private let appearance = Appearance()
  
  enum SnackbarIcons: String {
    case success
    case error
  }
  
  // MARK: - UI Elements
  
  lazy var iconImage: UIImageView = {
    var view = UIImageView()
    
    view.image = UIImage(named: SnackbarIcons.error.rawValue)
    
    return view
  }()
  
  lazy var contentLabel: UILabel = {
    var label = UILabel()
    
    label.font = UIFont.SharedTextStyles.subhead
    label.numberOfLines = 0
    
    return label
  }()
  
  // MARK: - Lifecycle View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .white
    
    self.layer.cornerRadius = 10.0
    self.layer.shadowOpacity = 1
    self.layer.shadowOffset = .zero
    self.layer.shadowRadius = 5
    self.layer.shouldRasterize = true
    self.layer.rasterizationScale = UIScreen.main.scale
    
    self.setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    self.setupConstraints()
  }
  
  // MARK: - Setup func
  
  func setupViews() {
    addSubview(iconImage)
    addSubview(contentLabel)
  }
  
  func setupConstraints() {
    snp.makeConstraints { make in
      make.height.equalTo(48.0).priority(.required)
    }
    
    iconImage.snp.makeConstraints { make in
      make.size.equalTo(appearance.heightBlock)
      make.centerY.equalToSuperview()
      make.left.equalToSuperview().offset(12.0)
    }
    
    contentLabel.snp.makeConstraints { make in
      make.height.equalTo(appearance.heightBlock)
      make.left.equalTo(iconImage.snp.right).offset(appearance.offset)
      make.right.equalToSuperview().offset(-appearance.offset)
      make.centerY.equalToSuperview()
    }
  }
  
  func setContent(icon: SnackbarIcons, contentText: String) {
    iconImage.image = UIImage(named: icon.rawValue)
    contentLabel.text = contentText
  }
}

