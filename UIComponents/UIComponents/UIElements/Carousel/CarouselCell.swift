//
//  CarouselCell.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 25/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class CarouselCell: UICollectionViewCell {
  
  static let cellId = "CarouselCell"
  
  private lazy var photoView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .gray
    imageView.contentMode = .scaleAspectFill
    
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    self.backgroundColor = .gray
    self.setupSubviews()
    self.setupConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupSubviews() {
    self.addSubview(self.photoView)
  }
  
  private func setupConstraints() {
    self.photoView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
  }
  
  func setPhoto(withURL url: URL?) {
    self.photoView.sd_setImage(with: url, placeholderImage: UIImage(named: "noImage")) { (_, _, cacheType, _) in
      if cacheType == SDImageCacheType.none {
        self.photoView.alpha = 0
        UIView.animate(withDuration: 0.2, animations: {
          self.photoView.alpha = 1
        })
      } else {
        self.photoView.alpha = 1
      }
    }
  }
}
