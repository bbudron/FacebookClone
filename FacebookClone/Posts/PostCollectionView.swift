//
//  PostCollectionView.swift
//  FacebookClone
//
//  Created by Brandon B on 8/17/21.
//

import UIKit

class PostCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    let items = [true, true, true, true]

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        register(PostCollectionViewCell.self, forCellWithReuseIdentifier: "PostCollectionViewCell")
        backgroundColor = .init(white: 0.9, alpha: 1)
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
        return cell
    }
}
