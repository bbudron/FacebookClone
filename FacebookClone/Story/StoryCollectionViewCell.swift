//
//  StoryCollectionViewCell.swift
//  FacebookClone
//
//  Created by Brandon B on 8/25/21.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    var profileImageView: UIImageView!
    var nameLabel: UILabel!
    var backgroundImageView: UIImageView!
    var gradientLayer: CAGradientLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        if profileImageView != nil {
            profileImageView.removeFromSuperview()
            profileImageView = nil
        }

        if nameLabel != nil {
            nameLabel.removeFromSuperview()
            nameLabel = nil
        }
        
        if backgroundImageView != nil {
            backgroundImageView.removeFromSuperview()
            backgroundImageView = nil
        }
        
        if gradientLayer != nil {
            gradientLayer.removeFromSuperlayer()
            gradientLayer = nil
        }
    }

    func setupCell(post: Post) {
        setupBackgroundImage(image: post.profileImage)
        setupGradientLayer()
        setupName(name: post.name)
    }
    
    func setupBackgroundImage(image: String) {
        backgroundImageView = UIImageView()
        let im = UIImage(named: "Jordan1_3")
        backgroundImageView.image = im
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.layer.cornerRadius = 20
        backgroundImageView.layer.masksToBounds = true
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.7, 1.1]
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = 20
        layer.addSublayer(gradientLayer)
    }
    
    func setupName(name: String) {
        nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .white
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
