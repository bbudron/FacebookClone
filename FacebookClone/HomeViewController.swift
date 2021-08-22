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
    var navigationView: UIView!
    var sneakers: UIButton!
    var favorites: UIButton!
    var favoritesView = FavoritesTableView()

    var postCollectionView: PostCollectionView!
    var sneakerCollection: [[Sneaker]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(white: 0.9, alpha: 1)
        
        sneakerCollection = fetchKicks()
        setupStoryCollectionView()
        setupNavigationView()
        setupPostCollectionView()
    }
    
    func setupStoryCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: view.frame.width / 4,
            height: 150
        )
        layout.scrollDirection = .horizontal
        
        let thumbnails = extractRandomThumbnails()
        
        storyCollectionView = StoryCollectionView(frame: view.frame, collectionViewLayout: layout, items: thumbnails)
        view.addSubview(storyCollectionView)
        NSLayoutConstraint.activate([
            storyCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            storyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            storyCollectionView.heightAnchor.constraint(equalToConstant: layout.itemSize.height)
        ])
    }
    
    func extractThumbnails() -> [Sneaker] {
        sneakerCollection.map { sneaker in
            sneaker[0]
        }
    }
    
    func extractRandomThumbnails() -> [Sneaker] {
        var thumbnails: [Sneaker] = []
        sneakerCollection.forEach { sneaker in
            let range = sneaker.count - 1
            let random = Int.random(in: 0...range)
            thumbnails.append(sneaker[random])
        }
        return thumbnails
    }
    
    func setupNavigationView() {
        navigationView = UIView()
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navigationView)
        NSLayoutConstraint.activate([
            navigationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 75)
        ])
        
        sneakers = UIButton()
        sneakers.backgroundColor = .white
        sneakers.translatesAutoresizingMaskIntoConstraints = false
        sneakers.addTarget(self, action: #selector(displaySneakers), for: .allEvents)
        navigationView.addSubview(sneakers)
        NSLayoutConstraint.activate([
            sneakers.topAnchor.constraint(equalTo: navigationView.topAnchor),
            sneakers.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor),
            sneakers.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor),
            sneakers.trailingAnchor.constraint(equalTo: navigationView.centerXAnchor)
        ])
        
        favorites = UIButton()
        favorites.backgroundColor = .gray
        favorites.translatesAutoresizingMaskIntoConstraints = false
        favorites.addTarget(self, action: #selector(setupFavoritesView), for: .allEvents)
        navigationView.addSubview(favorites)
        NSLayoutConstraint.activate([
            favorites.topAnchor.constraint(equalTo: navigationView.topAnchor),
            favorites.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor),
            favorites.leadingAnchor.constraint(equalTo: navigationView.centerXAnchor),
            favorites.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor)
        ])
    }
    
    @objc func displaySneakers() {
        sneakers.backgroundColor = .white
        favorites.backgroundColor = .gray
        
        favoritesView.removeFromSuperview()
    }
    
    @objc func setupFavoritesView() {
        sneakers.backgroundColor = .gray
        favorites.backgroundColor = .white
        
        view.addSubview(favoritesView)
        NSLayoutConstraint.activate([
            favoritesView.topAnchor.constraint(equalTo: view.topAnchor),
            favoritesView.bottomAnchor.constraint(equalTo: navigationView.topAnchor),
            favoritesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoritesView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupPostCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: view.frame.width,
            height: ((view.frame.width * 0.75) + (view.frame.width / 3 - 8.75) * 0.75) - 38
        )
        layout.scrollDirection = .vertical
        
        let posts: [Post] = sneakerCollection[0].map { sneaker in
            Post.init(
                id: "1",
                name: sneaker.name,
                date: sneaker.year,
                title: sneaker.color,
                profileImage: "Jordan1_2",
                images: [sneaker.image, "Jordan1_3", "Jordan1_2", "Jordan1_3", "Jordan1_1"]
            )
        }
        
        postCollectionView = PostCollectionView(frame: self.view.frame, collectionViewLayout: layout, posts: posts)
        view.addSubview(postCollectionView)
        NSLayoutConstraint.activate([
            postCollectionView.topAnchor.constraint(equalTo: storyCollectionView.bottomAnchor, constant: 10),
            postCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postCollectionView.bottomAnchor.constraint(equalTo: navigationView.topAnchor)
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
                
                sneakerCollection = fetchKicks()
                
                let posts: [Post] = sneakerCollection[model].map { sneaker in
                    Post.init(
                        id: "1",
                        name: sneaker.name,
                        date: sneaker.year,
                        title: sneaker.color,
                        profileImage: "Jordan1_2",
                        images: [sneaker.image, "Jordan1_3", "Jordan1_2", "Jordan1_3", "Jordan1_1"]
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
    let image : String
    let year : String
    let color : String
}

func fetchKicks() -> [[Sneaker]] {
//    if jordan <= 23 {
    var c : [[Sneaker]] = []
    for i in 1...23 {
        let filename = Bundle.main.path(forResource: "jordan\(i)", ofType: "csv")

        do {
            let content = try String(contentsOfFile: filename!)
            
            var parsedCSV: [Sneaker] = []
            
            content.components(separatedBy: "\n")
            .forEach({ row in
                let sneaker = row.components(separatedBy: ",")
                
                let name: String? = sneaker.indices.contains(1) ? sneaker[1] : nil
                let image: String? = sneaker.indices.contains(2) ? sneaker[2] : nil
                let year: String? = sneaker.indices.contains(3) ? sneaker[3] : nil
                let color: String? = sneaker.indices.contains(4) ? sneaker[4] : nil
                
                if let name = name, let image = image, let year = year, let color = color {
                    parsedCSV.append(
                        Sneaker.init(
                            name: name.replacingOccurrences(of: "\"", with: ""),
                            image: image.replacingOccurrences(of: "\"", with: ""),
                            year: year.replacingOccurrences(of: "\"", with: ""),
                            color: color.replacingOccurrences(of: "\"", with: "")
                        )
                    )
                }
            })

            parsedCSV.removeFirst()
            c.append(parsedCSV)
        } catch {
            print(error)
            fatalError()
            return []
        }
    }
    return c
}

