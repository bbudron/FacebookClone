//
//  PostImageCollectionView.swift
//  FacebookClone
//
//  Created by Brandon B on 8/17/21.
//

import UIKit

class PostImageCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var images : [String]!
    
    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, images: [String]) {
        self.images = images
        super.init(frame: frame, collectionViewLayout: layout)
        register(PostImageCollectionViewCell.self, forCellWithReuseIdentifier: "PostImageCollectionViewCell")
        backgroundColor = .init(white: 0.7, alpha: 1)
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        images = nil
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if images.count > 1 {
            if indexPath.row == 0 || indexPath.row == 1 {
                let width = (frame.width / 2) - 5
                let height = width * 0.75
                return .init(width: width, height: height)
            }
            let cellSpacing: CGFloat = 3
            let width = frame.width / cellSpacing - 8.75
            let height = width * 0.75
            return .init(width: width, height: height)
        } else {
            return .init(width: frame.width, height: frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostImageCollectionViewCell", for: indexPath) as! PostImageCollectionViewCell
        cell.setupImage(image: images[0])
        return cell
    }
}
