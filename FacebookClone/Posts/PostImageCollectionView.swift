//
//  PostImageCollectionView.swift
//  FacebookClone
//
//  Created by Brandon B on 8/17/21.
//

import UIKit

class PostImageCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        register(PostImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        backgroundColor = .init(white: 0.7, alpha: 1)
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 || indexPath.row == 1 {
            let width = (frame.width / 2) - 5
            let height = width * 0.75
            return .init(width: width, height: height)
        }
        let cellSpacing: CGFloat = 3
        let width = frame.width / cellSpacing - 8.75
        let height = width * 0.75
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! PostImageCollectionViewCell
        cell.setupImage(index: indexPath.row)
        return cell
    }
}
