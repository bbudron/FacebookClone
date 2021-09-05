//
//  NewPostView.swift
//  FacebookClone
//
//  Created by Brandon B on 9/1/21.
//

import UIKit

class NewPostView: UIStackView {
    let profilePictureContainer = UIView()
    let profilePicture = UIView()
    
    let creatNewPostContainer = UIView()
    let creatNewPostStack = UIStackView()
    let createNewPostImage = UIImageView()
    let createNewPostLabel = UILabel()

    let uploadImageContainer = UIView()
    let uploadImage = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        axis = .horizontal
        spacing = 25
        backgroundColor = .clear
        alignment = .center
        distribution = .equalSpacing
        translatesAutoresizingMaskIntoConstraints = false
        
        setupProfilePicture()
        setupCreateNewPost()
        setupUploadImage()
        
        NSLayoutConstraint.activate([
            profilePictureContainer.topAnchor.constraint(equalTo: topAnchor),
            profilePictureContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            profilePictureContainer.heightAnchor.constraint(equalToConstant: 65),
            profilePictureContainer.widthAnchor.constraint(equalToConstant: 65),
            
            profilePicture.topAnchor.constraint(equalTo: profilePictureContainer.topAnchor, constant: 10),
            profilePicture.bottomAnchor.constraint(equalTo: profilePictureContainer.bottomAnchor, constant: -10),
            profilePicture.leadingAnchor.constraint(equalTo: profilePictureContainer.leadingAnchor, constant: 10),
            profilePicture.trailingAnchor.constraint(equalTo: profilePictureContainer.trailingAnchor, constant: -10),


            creatNewPostContainer.topAnchor.constraint(equalTo: topAnchor),
            creatNewPostContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            creatNewPostContainer.leadingAnchor.constraint(equalTo: profilePictureContainer.trailingAnchor),
            creatNewPostContainer.trailingAnchor.constraint(equalTo: uploadImageContainer.leadingAnchor),

            creatNewPostStack.topAnchor.constraint(equalTo: creatNewPostContainer.topAnchor, constant: 20),
            creatNewPostStack.bottomAnchor.constraint(equalTo: creatNewPostContainer.bottomAnchor, constant: -20),
            creatNewPostStack.centerXAnchor.constraint(equalTo: creatNewPostContainer.centerXAnchor),
//            creatNewPost.leadingAnchor.constraint(equalTo: creatNewPostContainer.leadingAnchor),
//            creatNewPost.trailingAnchor.constraint(equalTo: creatNewPostContainer.trailingAnchor),


            createNewPostImage.widthAnchor.constraint(equalToConstant: 25),
//            createNewPostImage.heightAnchor.constraint(equalToConstant: 20),
//            createNewPostLabel.centerYAnchor.constraint(equalTo: creatNewPost.centerYAnchor),
//            createNewPostLabel.centerXAnchor.constraint(equalTo: creatNewPost.centerXAnchor),

            
            uploadImageContainer.topAnchor.constraint(equalTo: topAnchor),
            uploadImageContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            uploadImageContainer.widthAnchor.constraint(equalToConstant: 65),

            uploadImage.topAnchor.constraint(equalTo: uploadImageContainer.topAnchor, constant: 10),
            uploadImage.bottomAnchor.constraint(equalTo: uploadImageContainer.bottomAnchor, constant: -10),
            uploadImage.leadingAnchor.constraint(equalTo: uploadImageContainer.leadingAnchor, constant: 10),
            uploadImage.trailingAnchor.constraint(equalTo: uploadImageContainer.trailingAnchor, constant: -10),
        ])
    }
    
    func setupProfilePicture() {
        profilePictureContainer.backgroundColor = .none
        profilePictureContainer.translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(profilePictureContainer)

        profilePicture.backgroundColor = .systemGray
        profilePicture.layer.masksToBounds = false
        profilePicture.layer.cornerRadius = 22.5
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        profilePictureContainer.addSubview(profilePicture)
    }
    
    func setupCreateNewPost() {
        creatNewPostContainer.backgroundColor = .systemGray
        creatNewPostContainer.layer.cornerRadius = 10
        creatNewPostContainer.translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(creatNewPostContainer)
        
        creatNewPostStack.backgroundColor = .none
        creatNewPostStack.axis = .horizontal
        creatNewPostStack.spacing = 10
        creatNewPostStack.translatesAutoresizingMaskIntoConstraints = false
        creatNewPostContainer.addSubview(creatNewPostStack)
        
        createNewPostImage.image = UIImage(named: "Post")
        createNewPostImage.translatesAutoresizingMaskIntoConstraints = false
        creatNewPostStack.addArrangedSubview(createNewPostImage)
        
        createNewPostLabel.text = "Create new post"
//        createNewPostLabel.translatesAutoresizingMaskIntoConstraints = false
        creatNewPostStack.addArrangedSubview(createNewPostLabel)
    }
    
    func setupUploadImage() {
        uploadImageContainer.backgroundColor = .none
        uploadImageContainer.translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(uploadImageContainer)
        
        uploadImage.backgroundColor = .systemGray
        uploadImage.layer.cornerRadius = 22.5
        uploadImage.translatesAutoresizingMaskIntoConstraints = false
        uploadImageContainer.addSubview(uploadImage)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
