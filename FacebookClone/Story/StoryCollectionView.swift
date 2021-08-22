//
//  StoryCollectionView.swift
//  FacebookClone
//
//  Created by Brandon B on 8/21/21.
//

import UIKit

class StoryCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    let items : [Sneaker]

    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, items: [Sneaker]) {
        self.items = items
        super.init(frame: frame, collectionViewLayout: layout)
        register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        backgroundColor = .init(white: 0.9, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 23
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        cell.setupCell(post: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "changedModel"),
            object: nil,
            userInfo: ["model": indexPath.row]
        )
    }
}
