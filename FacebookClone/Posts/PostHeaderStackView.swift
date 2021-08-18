//
//  PostHeaderStackView.swift
//  FacebookClone
//
//  Created by Brandon B on 8/17/21.
//

import UIKit

class PostHeaderStackView: UIStackView {
    let profileImageView = UIImageView()

    var nameDateStackView = UIStackView()
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = 8
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40),
            leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        setupImageView()
        setupNameLabel()
        setupDateLabel()
        setupNameDateStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        profileImageView.backgroundColor = .red
        addArrangedSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            profileImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupNameLabel() {
        nameLabel.text = "Name Labelllllllllllllllllllll"
    }
    
    func setupDateLabel() {
        dateLabel.text = "6/66/6666"
    }
    
    func setupNameDateStackView() {
        nameDateStackView.addArrangedSubview(nameLabel)
        nameDateStackView.addArrangedSubview(dateLabel)
        nameDateStackView.translatesAutoresizingMaskIntoConstraints = false
        nameDateStackView.axis = .vertical
        nameDateStackView.spacing = 8
        addArrangedSubview(nameDateStackView)
    }
}
