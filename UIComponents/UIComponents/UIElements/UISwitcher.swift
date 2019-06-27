//
//  UISwitcher.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 27/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import SnapKit
import UIKit

extension UISwitcher {
  struct Appearance {
    let labelFont = UIFont.SharedTextStyles.body
    let labelColor = UIColor.SharedColorStyles.mainText
    
    let switcherHeight: Int = 30
    let switcherWidth: Int = 50
    
    let spaceBetweenElements: Int = 50
    let margins: Int = 0
  }
}

extension UISwitcher: FieldBordered {
  public func changeBorderVisibility(to newValue: Bool) {
    self.needBorder = newValue
    self.updateBorders()
  }
}

class UISwitcher: UIView {
  init(isOn: Bool = false, withBordersAt location: Set<BorderPosition> = []) {
    self.margins = appearance.margins
    self.isOnAtInit = isOn
    self.locations = location
    
    super.init(frame: CGRect.zero)
    
    self.setupViews(bordersLocation: location)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private let appearance: Appearance = Appearance()
  private var shouldSetupConstraints: Bool = true
  var didFlip = DelegatedCall<Bool>()
  private var margins: Int
  private var isOnAtInit: Bool
  private var needBorder: Bool = false
  private var locations: Set<BorderPosition> = []
  
  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = appearance.labelFont
    label.textColor = appearance.labelColor
    
    return label
  }()
  
  private lazy var switcher: UISwitch = {
    let switcher = UISwitch()
    switcher.isOn = self.isOnAtInit
    switcher.addTarget(self, action: #selector(self.switchDidFlip(_:)), for: .valueChanged)
    
    return switcher
  }()
  
  override func updateConstraints() {
    if shouldSetupConstraints {
      setupConstraints()
      shouldSetupConstraints = false
    }
    
    super.updateConstraints()
  }
  
  @objc func switchDidFlip(_ switcher: UISwitch) {
    self.didFlip.callback?(switcher.isOn)
  }
  
  func setTitle(_ title: String) {
    self.label.text = title
  }
  
  func setMargins(_ margins: Int) {
    self.margins = margins
  }
  
  func setFont(_ font: UIFont) {
    self.label.font = font
  }
  
  func isOn() -> Bool {
    return self.switcher.isOn
  }
  
  func setIsOn(_ isOn: Bool) {
    self.switcher.isOn = isOn
  }
  
  func getSwitchState() -> Bool {
    return switcher.isOn
  }
  
  private func setupViews(bordersLocation: Set<BorderPosition>) {
    for position in bordersLocation {
      self.addBorderView(to: self, position: position, color: UIColor.SharedColorStyles.dividerLine)
    }
    
    self.addSubview(label)
    self.addSubview(switcher)
  }
  
  private func setupConstraints() {
    switcher.snp.makeConstraints { (make) in
      make.height.equalTo(appearance.switcherHeight)
      make.width.equalTo(appearance.switcherWidth)
      make.centerY.equalToSuperview()
      make.right.equalToSuperview()
    }
    
    label.snp.makeConstraints { (make) in
      make.centerY.equalToSuperview()
      make.left.equalToSuperview()
      make.right.equalTo(switcher.snp.left).offset(-appearance.spaceBetweenElements)
    }
    
    snp.makeConstraints { make in
      make.bottom.equalTo(switcher.snp.bottom).offset(margins)
      make.top.equalTo(switcher.snp.top).offset(-margins)
    }
  }
  
  @objc public func hideWithReset() {
    setIsOn(false)
    isHidden = true
  }
  
  @objc public func showWithReset() {
    setIsOn(false)
    isHidden = false
  }
  
  private func updateBorders() {
    self.subviews.forEach { (view) in
      if view.tag == 100 || view.tag == 101 {
        view.removeFromSuperview()
      }
    }
    if needBorder {
      for position in self.locations {
        self.addBorderView(to: self, position: position, color: UIColor.SharedColorStyles.dividerLine)
      }
    }
    self.layoutIfNeeded()
  }
}
