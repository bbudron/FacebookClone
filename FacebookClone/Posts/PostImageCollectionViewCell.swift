//
//  PostImageCollectionViewCell.swift
//  FacebookClone
//
//  Created by Brandon B on 8/17/21.
//

import UIKit

class PostImageCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImage(index: Int) {
        let imageView = UIImageView(frame: bounds)
//        imageView.image = UIImage(named: "Jordan1_\(index + 1)")
        imageView.image = UIImage(named: "Jordan1_1")
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
    }
}
