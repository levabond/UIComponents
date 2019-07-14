//
//  ButtonWithCircle.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 14/07/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

protocol ButtonWithCircleCounterDelegate: class {
  func handleTap()
}

class ButtonWithCircleCounter: UIButton {
  weak var delegate: ButtonWithCircleCounterDelegate?
  lazy var staticImage: UIImageView = {
    let imageView = UIImageView(image: nil)
    
    return imageView
  }()
  
  lazy var caption: UILabel = {
    let label = UILabel()
    label.font = UIFont.SharedTextStyles.body
    label.textColor = UIColor.white
    
    return label
  }()
  
  lazy var contentCircle: UIView = {
    let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 36.0, height: 36.0)))
    view.backgroundColor = UIColor.white
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 18.0
    view.isHidden = true
    view.clipsToBounds = true
    
    return view
  }()
  
  lazy var circleLabel: UILabel = {
    let label = UILabel()
    label.text = nil
    label.font = UIFont.SharedTextStyles.headline
    label.textColor = UIColor.SharedColorStyles.secondaryAccent
    
    return label
  }()
  
  init() {
    super.init(frame: .zero)
    self.backgroundColor = UIColor.SharedColorStyles.secondaryAccent
    self.layer.cornerRadius = 22.0
    self.setupSubviews()
    self.setupConstraintsIfCircleNotVisible()
    self.addTarget(self, action: #selector(self.handleTap), for: .touchUpInside)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupSubviews() {
    self.addSubview(self.staticImage)
    self.addSubview(self.caption)
    self.addSubview(self.contentCircle)
    self.contentCircle.addSubview(self.circleLabel)
  }
  
  func setupConstraintsIfCircleVisible() {
    self.staticImage.snp.remakeConstraints { make in
      make.height.equalTo(18.0)
      make.width.equalTo(20.0)
      make.left.equalToSuperview().offset(24.0)
      make.centerY.equalToSuperview()
    }
    self.caption.snp.remakeConstraints { make in
      make.left.equalTo(staticImage.snp.right).offset(15.0)
      make.centerY.equalToSuperview()
    }
    self.contentCircle.snp.remakeConstraints { make in
      make.left.equalTo(caption.snp.right).offset(15.0)
      make.right.equalToSuperview().offset(-5.0)
      make.centerY.equalToSuperview()
      make.width.height.equalTo(36.0)
    }
    self.snp.updateConstraints { make in
      make.height.equalTo(44.0)
    }
    self.circleLabel.snp.remakeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
    
    self.layoutIfNeeded()
  }
  
  func setupConstraintsIfCircleNotVisible() {
    self.staticImage.snp.remakeConstraints { make in
      make.height.equalTo(18.0)
      make.width.equalTo(20.0)
      make.left.equalToSuperview().offset(24.0)
      make.centerY.equalToSuperview()
    }
    self.caption.snp.remakeConstraints { make in
      make.left.equalTo(staticImage.snp.right).offset(15.0)
      make.right.equalTo(self.snp.right).offset(-24.0)
      make.centerY.equalToSuperview()
    }
    self.snp.updateConstraints { make in
      make.height.equalTo(44.0)
    }
    
    self.layoutIfNeeded()
  }
  
  public func setCaption(_ caption: String) {
    self.caption.text = caption
  }
  
  public func setStaticImage(_ image: UIImage) {
    self.staticImage.image = image
    self.staticImage.setImage(color: UIColor.white)
  }
  
  @objc func handleTap() {
    self.delegate?.handleTap()
  }
  
  public func updateCircleContent(_ string: String?) {
    if string == nil || string?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
      self.contentCircle.isHidden = true
      self.setupConstraintsIfCircleNotVisible()
    } else {
      self.contentCircle.isHidden = false
      self.setupConstraintsIfCircleVisible()
    }
    self.circleLabel.text = string
  }
  
  func showWithAnimation() {
    
    UIView.animate(withDuration: 0.3) {
      self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
      self.alpha = 1.0
    }
  }
  
  func hideWithAnimation() {
    
    UIView.animate(withDuration: 0.3) {
      self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
      self.alpha = 0
    }
  }
}

