//
//  PostImageCollectionViewCell.swift
//  FacebookClone
//
//  Created by Brandon B on 8/17/21.
//

import UIKit

class PostImageCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView.removeFromSuperview()
        imageView = nil
    }
    
    func setupImage(image: String) {
        imageView = UIImageView(frame: bounds)
        let url = URL(string: image)!
        imageView.downloadImage(from: url)
//        imageView.image = UIImage(named: "Jordan1_3")
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
    }
}
