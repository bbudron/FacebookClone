//
//  MainController.swift
//  FacebookClone
//
//  Created by Brandon B on 8/16/21.
//

import UIKit

class Cell: UICollectionViewCell {
    let cellID = "Cell"
    
    var containerStackView = UIStackView()
    var imageNameDateStackView = UIStackView()
    var nameDateStackView = UIStackView()
    
    let imageView = UIImageView()
    
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let postLabel = UILabel()
    
    let imageViewGrid = UIView()

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
        imageView.backgroundColor = .red
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
        imageNameDateStackView.addArrangedSubview(imageView)
        imageNameDateStackView.addArrangedSubview(nameDateStackView)
        imageNameDateStackView.translatesAutoresizingMaskIntoConstraints = false
        imageNameDateStackView.axis = .horizontal
        imageNameDateStackView.spacing = 8
    }
    
    func setupPostLabel() {
        postLabel.text = "Here is my post text"
    }
    
    func setupImageViewGrid() {
        imageViewGrid.backgroundColor = .yellow
    }
    
    func setupVStackView() {
        containerStackView.addArrangedSubview(imageNameDateStackView)
        containerStackView.addArrangedSubview(postLabel)
        containerStackView.addArrangedSubview(imageViewGrid)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .vertical
        containerStackView.spacing = 8
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageNameDateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageNameDateStackView.heightAnchor.constraint(equalToConstant: 40),
            imageNameDateStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageNameDateStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: imageNameDateStackView.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            imageView.widthAnchor.constraint(equalToConstant: 40)
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
        view.backgroundColor = .white
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 300)
        
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
