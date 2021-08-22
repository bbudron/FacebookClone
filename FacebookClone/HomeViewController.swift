//
//  HomeViewController.swift
//  FacebookClone
//
//  Created by Brandon B on 8/16/21.
//

import UIKit


//protocol SelectedModel {
//    func changeModel(jordan: Int) -> Void
//}

class HomeViewController: UIViewController {
    var storyCollectionView: StoryCollectionView!
    var postCollectionView: PostCollectionView!
    var sneakers: [Sneaker] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(white: 0.9, alpha: 1)
        
        sneakers = fetchKicks(jordan: 1)
        setupStoryCollectionView()
        setupPostCollectionView()
    }
    
    func setupStoryCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: view.frame.width / 4,
            height: 150
        )
        layout.scrollDirection = .horizontal
        
        storyCollectionView = StoryCollectionView(frame: view.frame, collectionViewLayout: layout, items: sneakers)
        view.addSubview(storyCollectionView)
        NSLayoutConstraint.activate([
            storyCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            storyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            storyCollectionView.heightAnchor.constraint(equalToConstant: layout.itemSize.height)
        ])
    }
    
    func setupPostCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: view.frame.width,
            height: ((view.frame.width * 0.75) + (view.frame.width / 3 - 8.75) * 0.75) - 38
        )
        layout.scrollDirection = .vertical
        
        let posts: [Post] = sneakers.map { sneaker in
            Post.init(
                id: "1",
                name: sneaker.name,
                date: "66.66.6666",
                title: sneaker.price,
                profileImage: "Jordan1_2",
                images: [sneaker.pic, "Jordan1_3", "Jordan1_2", "Jordan1_3", "Jordan1_1"]
            )
        }
        
        postCollectionView = PostCollectionView(frame: self.view.frame, collectionViewLayout: layout, posts: posts)
        view.addSubview(postCollectionView)
        NSLayoutConstraint.activate([
            postCollectionView.topAnchor.constraint(equalTo: storyCollectionView.bottomAnchor, constant: 10),
            postCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(changedModel(_:)),
            name: NSNotification.Name(rawValue: "changedModel"),
            object: nil
        )
    }
    
    @objc func changedModel(_ notification: NSNotification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let model = dict["model"] as? Int {
                
                sneakers = fetchKicks(jordan: model)
                
                let posts: [Post] = sneakers.map { sneaker in
                    Post.init(
                        id: "1",
                        name: sneaker.name,
                        date: "66.66.6666",
                        title: sneaker.price,
                        profileImage: "Jordan1_2",
                        images: [sneaker.pic, "Jordan1_3", "Jordan1_2", "Jordan1_3", "Jordan1_1"]
                    )
                }
                postCollectionView.reloadData(posts: posts)
            } else {
                fatalError()
            }
        } else {
            fatalError()
        }
    }
}











struct Sneaker: Codable {
    let name : String
    let price : String
    let pic : String
    let url : String
}

func fetchKicks(jordan: Int) -> [Sneaker] {
    let filename = Bundle.main.path(forResource: "jordan\(jordan)s", ofType: "csv")

    do {
        let content = try String(contentsOfFile: filename!)
        
        var parsedCSV: [Sneaker] = []
        
        content.components(separatedBy: "\n")
        .forEach({ row in
            let sneaker = row.components(separatedBy: ",")
            
            let name: String? = sneaker.indices.contains(3) ? sneaker[3] : nil
            let price: String? = sneaker.indices.contains(4) ? sneaker[4] : nil
            let pic: String? = sneaker.indices.contains(2) ? sneaker[2] : nil
            let url: String? = sneaker.indices.contains(1) ? sneaker[1] : nil
            
            if let name = name, let price = price, let pic = pic, let url = url {
                parsedCSV.append(
                    Sneaker.init(
                        name: name.replacingOccurrences(of: "\"", with: ""),
                        price: price.replacingOccurrences(of: "\"", with: ""),
                        pic: pic.replacingOccurrences(of: "\"", with: ""),
                        url: url
                    )
                )
            }
        })

        parsedCSV.removeFirst()
        return parsedCSV
    }
    catch {
        print(error)
        return []
    }
}

