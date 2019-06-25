//
//  CarouselCounter.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 25/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit

extension CarouselCounter {
  private struct Appearance {
    let counterTitleFont = UIFont.SharedTextStyles.caption2
    let counterTitleColor = UIColor.white
    let counterTitleAlingment: NSTextAlignment = .center
    let counterTitleEdgeInsets = UIEdgeInsets(top: -2.0, left: -8.0, bottom: -2.0, right: -8.0)
    
    let counterBackgroundColor = UIColor.black
    let counterBackgroundAlpha: CGFloat = 0.38
    let counterBackgroundCornerRadius: CGFloat = 4.0
  }
}

class CarouselCounter: UIView {
  
  private let appearance = Appearance()
  
  private var count: Int
  private var index: Int = 1
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = self.appearance.counterTitleFont
    label.textColor = self.appearance.counterTitleColor
    label.textAlignment = self.appearance.counterTitleAlingment
    
    return label
  }()
  
  private lazy var backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = self.appearance.counterBackgroundColor
    view.alpha = self.appearance.counterBackgroundAlpha
    view.layer.cornerRadius = self.appearance.counterBackgroundCornerRadius
    
    return view
  }()
  
  init(frame: CGRect = .zero, count: Int) {
    self.count = count
    super.init(frame: frame)
    self.setCurrentCounterTitle(withIndex: self.index, count: self.count)
    
    self.setupSubviews()
    self.setupConstraints()
    self.setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {}
  
  private func setupSubviews() {
    self.addSubview(self.backgroundView)
    self.addSubview(self.titleLabel)
  }
  
  private func setupConstraints() {
    
    self.titleLabel.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }
    
    self.backgroundView.snp.makeConstraints { (make) in
      make.edges.equalTo(self.titleLabel.snp.edges).inset(self.appearance.counterTitleEdgeInsets)
      make.edges.equalToSuperview()
    }
  }
  
  private func makeCurrentCounterTitle() -> String {
    return "\(self.index)/\(self.count)"
  }
  
  func setCurrentCounterTitle(withIndex index: Int, count: Int) {
    self.index = index
    self.count = count
    self.titleLabel.text = self.makeCurrentCounterTitle()
    self.layoutIfNeeded()
  }
  
  func setCounterWithArray<T>(_ array: [T]) {
    self.setCurrentCounterTitle(withIndex: 1, count: array.count)
  }
  
  func setIndex(_ index: Int) {
    self.index = index
    self.titleLabel.text = self.makeCurrentCounterTitle()
  }
}

