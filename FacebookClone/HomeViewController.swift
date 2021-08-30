//
//  HomeViewController.swift
//  FacebookClone
//
//  Created by Brandon B on 8/16/21.
//
import UIKit

class HomeViewController: UIViewController, ChangeTabDelegate {
    let scrollView = UIScrollView()

    let scrollViewContainer = UIStackView()
    
    var sneakers: [Post] = []
    
    let navigationBar = UIView()
    let headerView = HeaderView()
    let fbLogoImageView = UIImageView(image: UIImage(named: "Facebook"))
    let messengerButton = UIButton()
    let searchButton = UIButton()
    
    var storyCollectionView: StoryCollectionView!
    var postCollectionView: PostCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(white: 0.9, alpha: 1)
        navigationController?.isNavigationBarHidden = true

        sneakers = fetchKicks(jordan: 1)

        setupNavBar()
        setupScrollView()
                
        setupStoryCollectionView()
        setupPostCollectionView()
    }
    
    func setupNavBar() {
        let safeAreaTop = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0

        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .white
        headerView.delegate = self
        view.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100 + safeAreaTop)
        ])
    }
    
    func changeTab(changeTo tab: Tabs) {
        print("you really changed the game \(tab)")
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollViewContainer.axis = .vertical
        scrollViewContainer.spacing = 10
        scrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(scrollViewContainer)
        NSLayoutConstraint.activate([
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setupStoryCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: view.frame.width / 4,
            height: 150
        )
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 15)

        storyCollectionView = StoryCollectionView(frame: view.frame, collectionViewLayout: layout, items: sneakers)
        scrollViewContainer.addArrangedSubview(storyCollectionView)
        NSLayoutConstraint.activate([
            storyCollectionView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
            storyCollectionView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
            storyCollectionView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    func setupPostCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: view.frame.width,
            height: ((view.frame.width * 0.75) + (view.frame.width / 3 - 8.75) * 0.75) - 38
        )
        layout.scrollDirection = .vertical
        
        postCollectionView = PostCollectionView(frame: view.frame, collectionViewLayout: layout, posts: sneakers)
        postCollectionView.isScrollEnabled = false
        scrollViewContainer.addArrangedSubview(postCollectionView)
        NSLayoutConstraint.activate([
            postCollectionView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
            postCollectionView.heightAnchor.constraint(equalToConstant: layout.itemSize.height * CGFloat(sneakers.count))
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
                postCollectionView.reloadData(posts: sneakers)
            } else {
                fatalError()
            }
        } else {
            fatalError()
        }
    }
}

func fetchKicks(jordan: Int) -> [Post] {
    let filename = Bundle.main.path(forResource: "jordan\(jordan)", ofType: "csv")

    do {
        let content = try String(contentsOfFile: filename!)
        
        var parsedCSV: [Post] = []
        
        content.components(separatedBy: "\n")
        .forEach({ row in
            let sneaker = row.components(separatedBy: ",")
            
            let name: String? = sneaker.indices.contains(3) ? sneaker[3] : nil
            let price: String? = sneaker.indices.contains(4) ? sneaker[4] : nil
            let pic: String? = sneaker.indices.contains(2) ? sneaker[2] : nil
            let url: String? = sneaker.indices.contains(1) ? sneaker[1] : nil
            
            if let name = name, let price = price, let pic = pic, let url = url {
                parsedCSV.append(
                    Post.init(
                        id: "1",
                        name: name.replacingOccurrences(of: "\"", with: ""),
                        date: url,
                        title: price.replacingOccurrences(of: "\"", with: ""),
                        profileImage: pic.replacingOccurrences(of: "\"", with: ""),
                        images: [pic.replacingOccurrences(of: "\"", with: ""), "Jordan1_3", "Jordan1_2", "Jordan1_3", "Jordan1_1"]
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

