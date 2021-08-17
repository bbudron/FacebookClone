//
//  MainController.swift
//  FacebookClone
//
//  Created by Brandon B on 8/16/21.
//

import UIKit

class ImageCell: UICollectionViewCell {
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

class Cell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let cellID = "Cell"
    
    var containerStackView = UIStackView()
    var imageNameDateStackView = UIStackView()
    var nameDateStackView = UIStackView()
    
    let profileImageView = UIImageView()
    
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let postLabel = UILabel()
    
    var imagesCollectionView: UICollectionView!
    
    let cellSpacing: CGFloat = 3

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupImageView()
        setupNameLabel()
        setupDateLabel()
        setupNameDateStackView()
        setupHStackView()
        setupPostLabel()
        setupImageViewGrid()
        setupVStackView()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        profileImageView.backgroundColor = .red
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
    }
    
    func setupHStackView() {
        imageNameDateStackView.addArrangedSubview(profileImageView)
        imageNameDateStackView.addArrangedSubview(nameDateStackView)
        imageNameDateStackView.translatesAutoresizingMaskIntoConstraints = false
        imageNameDateStackView.axis = .horizontal
        imageNameDateStackView.spacing = 8
    }
    
    func setupPostLabel() {
        postLabel.text = "Here is my post text"
    }
    
    func setupImageViewGrid() {
        let layout = UICollectionViewFlowLayout()
        
//        layout.sectionInset = UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
//        layout.itemSize = CGSize(width: frame.width / cellSpacing - 8.75, height: frame.width / cellSpacing - 8.75)

        imagesCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        imagesCollectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        imagesCollectionView.backgroundColor = .init(white: 0.7, alpha: 1)
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 || indexPath.row == 1 {
            let width = (frame.width / 2) - 5
            let height = width * 0.75
            return .init(width: width, height: height)
        }
        
        let width = frame.width / cellSpacing - 8.75
        let height = width * 0.75
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.setupImage(index: indexPath.row)
        return cell
    }
    
    func setupVStackView() {
        containerStackView.addArrangedSubview(imageNameDateStackView)
        containerStackView.addArrangedSubview(postLabel)
        containerStackView.addArrangedSubview(imagesCollectionView)
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
        
        NSLayoutConstraint.activate([
//            imageNameDateStackView.topAnchor.constraint(equalTo: containerStackView.topAnchor, constant: 15),
            imageNameDateStackView.heightAnchor.constraint(equalToConstant: 40),
            imageNameDateStackView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor),
            imageNameDateStackView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: imageNameDateStackView.topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
//            profileImageView.leadingAnchor.constraint(equalTo: imageNameDateStackView.leadingAnchor, constant: 15),
            profileImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}

class MainController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var collectionView: UICollectionView!

    let dateLabel = UILabel()
    let postTextLabel = UILabel()

    let items = ["hello", "WORLD", "1", "2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(white: 0.9, alpha: 1)
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: ((view.frame.width * 0.75) + (view.frame.width / 3 - 8.75) * 0.75) - 38)
//        layout.itemSize = CGSize(width: view.frame.width, height: 350)

        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        return cell
    }
}

import SwiftUI
struct MainPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        typealias UIViewControllerType = MainController

        func makeUIViewController(context: Context) -> MainController {
            MainController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            return
        }
    }
}
