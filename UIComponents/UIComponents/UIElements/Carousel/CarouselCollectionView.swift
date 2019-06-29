//
//  CarouselCollectionView.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 25/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit

protocol CarouselPhotoSwipeDelegate: class {
  func didPhotoSwipped(toIndex index: Int)
}

class CarouselCollectionView: UICollectionView {
  
  weak var photoSwipeDelegate: CarouselPhotoSwipeDelegate?
  
  var photosArray: [URL?] {
    didSet {
      self.reloadData()
      self.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: false)
    }
  }
  
  private let layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    
    return layout
  }()
  
  init(withPhotos photosArray: [URL?]) {
    self.photosArray = photosArray
    super.init(frame: .zero, collectionViewLayout: self.layout)
    self.backgroundColor = .gray
    self.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.cellId)
    self.dataSource = self
    self.delegate = self
    self.isPagingEnabled = true
    self.showsHorizontalScrollIndicator = false
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension CarouselCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.photosArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: CarouselCell.cellId, for: indexPath) as! CarouselCell
    cell.setPhoto(withURL: photosArray[indexPath.row])
    
    return cell
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    var visibleRect = CGRect()
    
    visibleRect.origin = self.contentOffset
    visibleRect.size = self.bounds.size
    
    let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
    
    let visibleIndexPath: IndexPath = self.indexPathForItem(at: visiblePoint)!
    
    self.photoSwipeDelegate?.didPhotoSwipped(toIndex: visibleIndexPath.row + 1)
    
    if scrollView == self {
      var currentCellOffset = self.contentOffset
      currentCellOffset.x += self.frame.width / 2
      if let indexPath = self.indexPathForItem(at: currentCellOffset) {
        self.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
      }
    }
  }
}

