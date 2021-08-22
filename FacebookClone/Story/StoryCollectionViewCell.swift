//
//  StoryCollectionViewCell.swift
//  FacebookClone
//
//  Created by Brandon B on 8/22/21.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var title: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        title.removeFromSuperview()
        title = nil
        
        imageView.removeFromSuperview()
        imageView = nil
    }

    func setupCell(post: Sneaker) {
        setupImage(image: post.image)
        setupText(text: post.year)
    }
    
    func setupImage(image: String) {
        imageView = UIImageView(frame: bounds)
        
        if let url = URL(string: image) {
            imageView.downloadImage(from: url)
        } else {
            imageView.backgroundColor = .red
        }
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
    }
    
    func setupText(text: String) {
        title = UILabel()
        title.text = text
        contentView.addSubview(title)
    }
}
