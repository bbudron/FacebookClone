//
//  PostHeaderStackView.swift
//  FacebookClone
//
//  Created by Brandon B on 8/17/21.
//

import UIKit

class PostHeaderStackView: UIStackView {
    var nameDateStackView: UIStackView!

    var profileImageView: UIImageView!
    var profileImage: String!
    
    var nameLabel: UILabel!
    var name: String!

    var dateLabel: UILabel!
    var date: String!
    
    init(frame: CGRect, profileImage: String, name: String, date: String) {
        self.profileImage = profileImage
        self.name = name
        self.date = date
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = 8
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40),
            leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        setupProfileImageView()
        setupNameLabel()
        setupDateLabel()
        setupNameDateStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        profileImageView.removeFromSuperview()
        profileImageView = nil
        profileImage = nil
        
        nameLabel.removeFromSuperview()
        nameLabel = nil
        name = nil
        
        dateLabel.removeFromSuperview()
        dateLabel = nil
        date = nil
        
        nameDateStackView.removeFromSuperview()
        nameDateStackView = nil
    }
    
    func setupProfileImageView() {
        profileImageView = UIImageView()
        profileImageView.backgroundColor = .gray
        addArrangedSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            profileImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.text = name
    }
    
    func setupDateLabel() {
        dateLabel = UILabel()
        dateLabel.text = date
    }
    
    func setupNameDateStackView() {
        nameDateStackView = UIStackView()
        nameDateStackView.addArrangedSubview(nameLabel)
        nameDateStackView.addArrangedSubview(dateLabel)
        nameDateStackView.translatesAutoresizingMaskIntoConstraints = false
        nameDateStackView.axis = .vertical
        nameDateStackView.spacing = 8
        addArrangedSubview(nameDateStackView)
    }
}
