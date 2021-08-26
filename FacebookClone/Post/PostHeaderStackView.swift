//
//  PostHeaderStackView.swift
//  FacebookClone
//
//  Created by Brandon B on 8/17/21.
//

import UIKit

class PostHeaderStackView: UIStackView {
    var nameDateStackView: UIStackView!

    var profileImageView: UIButton!
    var profileImage: String!
    
    var nameLabel: UILabel!
    var name: String!

    var dateLabel: UILabel!
    var date: String!
    
    var model: Int!
    var index: Int!

    init(frame: CGRect, profileImage: String, model: Int, index: Int, name: String, date: String) {
        self.profileImage = profileImage
        self.name = name
        self.date = date
        self.model = model
        self.index = index
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
        
        model = nil
        index = nil
    }
    
    func setupProfileImageView() {
        profileImageView = UIButton()
        profileImageView.backgroundColor = .gray
        profileImageView.addTarget(self, action: #selector(favorite), for: .touchUpInside)
        addArrangedSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            profileImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func favorite() {
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "toggleFavorite"),
            object: nil,
            userInfo: [
                "model": model,
                "index": index
            ]
        )
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
