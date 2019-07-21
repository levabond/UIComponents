
//
//  LoadingCell.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 20/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//


import UIKit
import SnapKit

extension LoadingTableViewCell {
  
  struct Appearance {
    let titleInsets = UIEdgeInsets(top: 12.0, left: 16.0, bottom: 0.0, right: 16.0)
    let titleSize = CGSize(width: 148.0, height: 24.0)
    
    let subtitleInsets = UIEdgeInsets(top: 12.0, left: 16.0, bottom: 0.0, right: 16.0)
    let subtitleHeight: CGFloat = 16.0
    
    let photoInsets = UIEdgeInsets(top: 12.0, left: 16.0, bottom: 0.0, right: 16.0)
    let photoRadius: CGFloat = 12.0
    let photoRatio: CGFloat = 0.5
    
    let captionInsets = UIEdgeInsets(top: 12.0, left: 16.0, bottom: 0.0, right: 16.0)
    let captionSize = CGSize(width: 176.0, height: 16.0)
    
    let dividerInsets = UIEdgeInsets(top: 12.0, left: 0.0, bottom: 0.0, right: 0.0)
    let dividerHeight: CGFloat = 16.0
    
    let cardBackgroundColor = UIColor.white
    let viewBackgroundColor = UIColor.SharedColorStyles.screenBackground
  }
}

class LoadingTableViewCell: UITableViewCell {
  
  var appearance = Appearance()
  
  lazy var titleView = self.createView(withRadius: self.appearance.titleSize.height/2)
  lazy var subtitleView = self.createView(withRadius: self.appearance.subtitleHeight/2)
  lazy var photoView = self.createView(withRadius: self.appearance.photoRadius)
  lazy var descriptionView = self.createView(withRadius: self.appearance.subtitleHeight/2)
  lazy var captionView = self.createView(withRadius: self.appearance.captionSize.height/2)
  
  lazy var dividerView: UIView = {
    let view = UIView()
    view.backgroundColor = appearance.viewBackgroundColor
    
    return view
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupSubviews()
    setupConstraints()
    selectionStyle = .none
  }
  
  func createView(withRadius radius: CGFloat?) -> UIView {
    let view = UIView()
    view.backgroundColor = self.appearance.viewBackgroundColor
    guard let radius = radius else { return view }
    view.setRadius(radius: radius)
    
    return view
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupSubviews() {
    contentView.addSubview(titleView)
    contentView.addSubview(subtitleView)
    contentView.addSubview(photoView)
    contentView.addSubview(descriptionView)
    contentView.addSubview(captionView)
    contentView.addSubview(dividerView)
  }
  
  func setupConstraints() {
    
    titleView.snp.makeConstraints { make in
      make.height.equalTo(20.0)
      make.top.equalToSuperview().offset(appearance.titleInsets.top)
      make.left.equalToSuperview().offset(appearance.titleInsets.left)
      make.width.lessThanOrEqualTo(appearance.titleSize.width).priority(.high)
      make.right.greaterThanOrEqualToSuperview().offset(-appearance.titleInsets.right).priority(.medium)
    }
    
    subtitleView.snp.makeConstraints { (make) in
      make.height.equalTo(appearance.subtitleHeight)
      make.top.equalTo(titleView.snp.bottom).offset(appearance.subtitleInsets.top)
      make.left.equalToSuperview().offset(appearance.subtitleInsets.left)
      make.right.equalToSuperview().offset(-appearance.subtitleInsets.right)
    }
    
    photoView.snp.makeConstraints { (make) in
      make.top.equalTo(subtitleView.snp.bottom).offset(appearance.photoInsets.top)
      make.left.equalToSuperview().offset(appearance.photoInsets.left)
      make.right.equalToSuperview().offset(-appearance.photoInsets.right)
      make.height.equalTo(144.0)
    }
    
    descriptionView.snp.makeConstraints { (make) in
      make.height.equalTo(appearance.subtitleHeight)
      make.top.equalTo(photoView.snp.bottom).offset(appearance.subtitleInsets.top)
      make.left.equalToSuperview().offset(appearance.subtitleInsets.left)
      make.right.equalToSuperview().offset(-appearance.subtitleInsets.right)
    }
    
    captionView.snp.makeConstraints { (make) in
      make.height.equalTo(appearance.captionSize.height)
      make.width.lessThanOrEqualTo(appearance.captionSize.width).priority(.high)
      make.top.equalTo(descriptionView.snp.bottom).offset(appearance.captionInsets.top)
      make.left.equalToSuperview().offset(appearance.captionInsets.left)
      make.right.greaterThanOrEqualToSuperview().offset(-appearance.captionInsets.right).priority(.medium)
    }
    
    dividerView.snp.makeConstraints { (make) in
      make.height.equalTo(appearance.dividerHeight)
      make.top.equalTo(captionView.snp.bottom).offset(appearance.dividerInsets.top)
      make.left.equalToSuperview().offset(appearance.dividerInsets.left)
      make.right.equalToSuperview().offset(-appearance.dividerInsets.right)
      make.bottom.equalToSuperview().offset(-appearance.dividerInsets.bottom)
    }
  }
}

