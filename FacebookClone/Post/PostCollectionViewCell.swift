//
//  PostCollectionViewCell.swift
//  FacebookClone
//
//  Created by Brandon B on 8/17/21.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {    
    var containerStackView: UIStackView!
    var postHeaderStackView: PostHeaderStackView!
    var postTitle: UILabel!
    var postImageCollectionView: PostImageCollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        containerStackView.removeArrangedSubview(postImageCollectionView)
        postImageCollectionView = nil
        
        containerStackView.removeArrangedSubview(postTitle)
        postTitle = nil
        
        containerStackView.removeArrangedSubview(postHeaderStackView)
        postHeaderStackView = nil
        
        containerStackView.removeFromSuperview()
        containerStackView = nil
    }

    func setupCell(post: Post) {
        postTitle = UILabel()
        postTitle.text = post.title
        
        postHeaderStackView = PostHeaderStackView(frame: frame, profileImage: post.profileImage, name: post.name, date: post.date)
        
        postImageCollectionView = PostImageCollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout(), images: post.images)
        
        setupContainerStackView()
    }
    
    func setupContainerStackView() {
        containerStackView = UIStackView()
        containerStackView.addArrangedSubview(postHeaderStackView)
        containerStackView.addArrangedSubview(postTitle)
        containerStackView.addArrangedSubview(postImageCollectionView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .vertical
        containerStackView.spacing = 8
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
