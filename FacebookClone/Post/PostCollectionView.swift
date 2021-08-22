//
//  PostCollectionView.swift
//  FacebookClone
//
//  Created by Brandon B on 8/17/21.
//

import UIKit

class PostCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    var posts : [Post]

    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, posts: [Post]) {
        self.posts = posts
        super.init(frame: frame, collectionViewLayout: layout)
        register(PostCollectionViewCell.self, forCellWithReuseIdentifier: "PostCollectionViewCell")
        backgroundColor = .init(white: 0.9, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
        cell.setupCell(post: posts[indexPath.row])
        return cell
    }
    
    func reloadData(posts: [Post]) {
        self.posts = posts
        setContentOffset(CGPoint(x: -contentInset.left, y: -contentInset.top), animated: true)
        super.reloadData()
    }
}
