//
//  HeaderView.swift
//  FacebookClone
//
//  Created by Brandon B on 8/29/21.
//

import UIKit

enum Tabs: Int {
    case Home = 0
    case Friends = 1
    case Watch = 2
    case Marketplace = 3
    case Groups = 4
}

protocol ChangeTabDelegate: AnyObject {
    func changeTab(changeTo tab: Tabs)
}

class HeaderView: UIView {
    let fbLogoImageView = UIImageView(image: UIImage(named: "Facebook"))
    let messengerButton = UIButton()
    let searchButton = UIButton()
    weak var delegate: ChangeTabDelegate?
    
    let navigation = UIStackView()
    
    let homeButton = UIButton()
    var homeUnderline = UIView()
    
    let friendsButton = UIButton()
    var friendsUnderline = UIView()
    
    let watchButton = UIButton()
    var watchUnderline = UIView()
    
    let marketplaceButton = UIButton()
    var marketplaceUnderline = UIView()
    
    let groupsButton = UIButton()
    var groupsUnderline = UIView()

    var selected: Tabs = .Home
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white

        fbLogoImageView.contentMode = .scaleAspectFit
        fbLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(fbLogoImageView)
        NSLayoutConstraint.activate([
            fbLogoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            fbLogoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            fbLogoImageView.widthAnchor.constraint(equalToConstant: 150),
            fbLogoImageView.heightAnchor.constraint(equalToConstant: 40)
        ])

        messengerButton.setImage(UIImage(named: "Messenger"), for: .normal)
        messengerButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(messengerButton)
        NSLayoutConstraint.activate([
            messengerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            messengerButton.centerYAnchor.constraint(equalTo: fbLogoImageView.centerYAnchor)
        ])
        
        searchButton.setImage(UIImage(named: "Search"), for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.trailingAnchor.constraint(equalTo: messengerButton.leadingAnchor, constant: -20),
            searchButton.centerYAnchor.constraint(equalTo: fbLogoImageView.centerYAnchor)
        ])
        
        navigation.axis = .horizontal
        navigation.translatesAutoresizingMaskIntoConstraints = false
        navigation.spacing = 1
        navigation.distribution = .fillEqually
        addSubview(navigation)
        NSLayoutConstraint.activate([
            navigation.topAnchor.constraint(equalTo: fbLogoImageView.bottomAnchor, constant: 10),
            navigation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            navigation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            navigation.widthAnchor.constraint(equalTo: widthAnchor),
            navigation.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        homeButton.setImage(UIImage(named: "Home")!.maskWithColor(color: .systemBlue), for: .normal)
        homeButton.imageView?.tintColor = .blue
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.tag = 0
        homeButton.addTarget(self, action: #selector(changeTab(sender:)), for: .touchUpInside)
        navigation.addArrangedSubview(homeButton)
        homeUnderline.backgroundColor = .systemBlue
        homeUnderline.translatesAutoresizingMaskIntoConstraints = false
        navigation.addSubview(homeUnderline)
        NSLayoutConstraint.activate([
            homeUnderline.leadingAnchor.constraint(equalTo: homeButton.leadingAnchor),
            homeUnderline.trailingAnchor.constraint(equalTo: homeButton.trailingAnchor),
            homeUnderline.heightAnchor.constraint(equalToConstant: 2),
            homeUnderline.bottomAnchor.constraint(equalTo: navigation.bottomAnchor)
        ])
        
        friendsButton.setImage(UIImage(named: "Friends")!.maskWithColor(color: .gray), for: .normal)
        friendsButton.translatesAutoresizingMaskIntoConstraints = false
        friendsButton.tag = 1
        friendsButton.addTarget(self, action: #selector(changeTab(sender:)), for: .touchUpInside)
        navigation.addArrangedSubview(friendsButton)
        friendsUnderline.backgroundColor = .white
        friendsUnderline.translatesAutoresizingMaskIntoConstraints = false
        navigation.addSubview(friendsUnderline)
        NSLayoutConstraint.activate([
            friendsUnderline.leadingAnchor.constraint(equalTo: friendsButton.leadingAnchor),
            friendsUnderline.trailingAnchor.constraint(equalTo: friendsButton.trailingAnchor),
            friendsUnderline.heightAnchor.constraint(equalToConstant: 2),
            friendsUnderline.bottomAnchor.constraint(equalTo: navigation.bottomAnchor)
        ])
        
        watchButton.setImage(UIImage(named: "Watch")!.maskWithColor(color: .gray), for: .normal)
        watchButton.translatesAutoresizingMaskIntoConstraints = false
        watchButton.tag = 2
        watchButton.addTarget(self, action: #selector(changeTab(sender:)), for: .touchUpInside)
        navigation.addArrangedSubview(watchButton)
        watchUnderline.backgroundColor = .white
        watchUnderline.translatesAutoresizingMaskIntoConstraints = false
        navigation.addSubview(watchUnderline)
        NSLayoutConstraint.activate([
            watchUnderline.leadingAnchor.constraint(equalTo: watchButton.leadingAnchor),
            watchUnderline.trailingAnchor.constraint(equalTo: watchButton.trailingAnchor),
            watchUnderline.heightAnchor.constraint(equalToConstant: 2),
            watchUnderline.bottomAnchor.constraint(equalTo: navigation.bottomAnchor)
        ])

        marketplaceButton.setImage(UIImage(named: "Marketplace")!.maskWithColor(color: .gray), for: .normal)
        marketplaceButton.translatesAutoresizingMaskIntoConstraints = false
        marketplaceButton.tag = 3
        marketplaceButton.addTarget(self, action: #selector(changeTab(sender:)), for: .touchUpInside)
        navigation.addArrangedSubview(marketplaceButton)
        marketplaceUnderline.backgroundColor = .white
        marketplaceUnderline.translatesAutoresizingMaskIntoConstraints = false
        navigation.addSubview(marketplaceUnderline)
        NSLayoutConstraint.activate([
            marketplaceUnderline.leadingAnchor.constraint(equalTo: marketplaceButton.leadingAnchor),
            marketplaceUnderline.trailingAnchor.constraint(equalTo: marketplaceButton.trailingAnchor),
            marketplaceUnderline.heightAnchor.constraint(equalToConstant: 2),
            marketplaceUnderline.bottomAnchor.constraint(equalTo: navigation.bottomAnchor)
        ])
        
        groupsButton.setImage(UIImage(named: "Groups")!.maskWithColor(color: .gray), for: .normal)
        groupsButton.translatesAutoresizingMaskIntoConstraints = false
        groupsButton.tag = 4
        groupsButton.addTarget(self, action: #selector(changeTab(sender:)), for: .touchUpInside)
        navigation.addArrangedSubview(groupsButton)
        groupsUnderline.backgroundColor = .white
        groupsUnderline.translatesAutoresizingMaskIntoConstraints = false
        navigation.addSubview(groupsUnderline)
        NSLayoutConstraint.activate([
            groupsUnderline.leadingAnchor.constraint(equalTo: groupsButton.leadingAnchor),
            groupsUnderline.trailingAnchor.constraint(equalTo: groupsButton.trailingAnchor),
            groupsUnderline.heightAnchor.constraint(equalToConstant: 2),
            groupsUnderline.bottomAnchor.constraint(equalTo: navigation.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func changeTab(sender: UIButton) {
        let prevSelection = selected
        guard let newSelection = Tabs(rawValue: sender.tag) else {
            fatalError()
        }
        
        if prevSelection != newSelection {
            switch prevSelection {
                case .Home:
                    homeButton.setImage(UIImage(named: "Home")!.maskWithColor(color: .gray), for: .normal)
                    homeUnderline.backgroundColor = .white

                case .Friends:
                    friendsButton.setImage(UIImage(named: "Friends")!.maskWithColor(color: .gray), for: .normal)
                    friendsUnderline.backgroundColor = .white

                case .Watch:
                    watchButton.setImage(UIImage(named: "Watch")!.maskWithColor(color: .gray), for: .normal)
                    watchUnderline.backgroundColor = .white

                case .Marketplace:
                    marketplaceButton.setImage(UIImage(named: "Marketplace")!.maskWithColor(color: .gray), for: .normal)
                    marketplaceUnderline.backgroundColor = .white
                    
                case .Groups:
                    groupsButton.setImage(UIImage(named: "Groups")!.maskWithColor(color: .gray), for: .normal)
                    groupsUnderline.backgroundColor = .white
            }
            
            switch newSelection {
                case .Home:
                    homeButton.setImage(UIImage(named: "Home")!.maskWithColor(color: .systemBlue), for: .normal)
                    homeUnderline.backgroundColor = .systemBlue

                case .Friends:
                    friendsButton.setImage(UIImage(named: "Friends")!.maskWithColor(color: .systemBlue), for: .normal)
                    friendsUnderline.backgroundColor = .systemBlue

                case .Watch:
                    watchButton.setImage(UIImage(named: "Watch")!.maskWithColor(color: .systemBlue), for: .normal)
                    watchUnderline.backgroundColor = .systemBlue

                case .Marketplace:
                    marketplaceButton.setImage(UIImage(named: "Marketplace")!.maskWithColor(color: .systemBlue), for: .normal)
                    marketplaceUnderline.backgroundColor = .systemBlue

                case .Groups:
                    groupsButton.setImage(UIImage(named: "Groups")!.maskWithColor(color: .systemBlue), for: .normal)
                    groupsUnderline.backgroundColor = .systemBlue

            }
            
            selected = newSelection
            delegate?.changeTab(changeTo: selected)
        }
    }
}
