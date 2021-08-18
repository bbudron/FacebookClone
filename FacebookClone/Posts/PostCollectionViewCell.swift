//
//  PostCollectionViewCell.swift
//  FacebookClone
//
//  Created by Brandon B on 8/17/21.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {    
    var containerStackView = UIStackView()
    var postHeaderStackView = PostHeaderStackView()
    
    let postLabel = UILabel()
    
    var postImageCollectionView: PostImageCollectionView!
    
    let cellSpacing: CGFloat = 3

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupPostLabel()
        setupImageViewGrid()
        setupVStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupPostLabel() {
        postLabel.text = "Here is my post text"
    }
    
    func setupImageViewGrid() {
        postImageCollectionView = PostImageCollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    func setupVStackView() {
        containerStackView.addArrangedSubview(postHeaderStackView)
        containerStackView.addArrangedSubview(postLabel)
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
