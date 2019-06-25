//
//  Carousel.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 25/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit
import SnapKit

class Carousel: UIView {
  
  private var photos: [URL?]
  
  lazy var collectionView: CarouselCollectionView = {
    let carouselCollectionView = CarouselCollectionView(withPhotos: self.photos)
    carouselCollectionView.photoSwipeDelegate = self
    
    return carouselCollectionView
  }()
  
  lazy var stubImage: UIImageView = {
    let imageView = UIImageView()
    let image = UIImage(named: "noImage")
    
    imageView.image = image
    imageView.isHidden = true
    
    return imageView
  }()
  
  lazy var counter: CarouselCounter = {
    let counter = CarouselCounter(count: self.photos.count)
    
    return counter
  }()
  
  lazy var collectionViewLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: self.bounds.width, height: self.bounds.height)
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    
    return layout
  }()
  
  init(frame: CGRect = .zero, photos: [URL?]) {
    self.photos = photos
    super.init(frame: frame)
    
    self.setupSubviews()
    self.setupConstraints()
    
    self.layer.cornerRadius = 8.0
    self.clipsToBounds = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupSubviews() {
    self.addSubview(self.collectionView)
    self.addSubview(self.counter)
    self.addSubview(self.stubImage)
  }
  
  private func setupConstraints() {
    self.collectionView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    self.counter.snp.makeConstraints { (make) in
      make.bottom.equalToSuperview().offset(-8.0)
      make.centerX.equalToSuperview()
    }
    
    self.stubImage.snp.makeConstraints { (make) in
      make.height.width.equalTo(40)
      make.center.equalToSuperview()
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.collectionView.setCollectionViewLayout(self.collectionViewLayout, animated: true)
  }
  
  func setPhotos(with photosArray: [URL?]) {
    self.collectionView.photosArray = photosArray
    self.collectionView.reloadData()
  }
}

extension Carousel: CarouselPhotoSwipeDelegate {
  func didPhotoSwipped(toIndex index: Int) {
    self.counter.setIndex(index)
    self.setNeedsLayout()
  }
}
