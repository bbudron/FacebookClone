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
    let friendsButton = UIButton()
    let watchButton = UIButton()
    let marketplaceButton = UIButton()
    let groupsButton = UIButton()
    
    var selected: Tabs = .Home
    var selectedTab = UIView()
    
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
        
        friendsButton.setImage(UIImage(named: "Friends")!.maskWithColor(color: .gray), for: .normal)
        friendsButton.translatesAutoresizingMaskIntoConstraints = false
        friendsButton.tag = 1
        friendsButton.addTarget(self, action: #selector(changeTab(sender:)), for: .touchUpInside)
        navigation.addArrangedSubview(friendsButton)
        
        watchButton.setImage(UIImage(named: "Watch")!.maskWithColor(color: .gray), for: .normal)
        watchButton.translatesAutoresizingMaskIntoConstraints = false
        watchButton.tag = 2
        watchButton.addTarget(self, action: #selector(changeTab(sender:)), for: .touchUpInside)
        navigation.addArrangedSubview(watchButton)

        marketplaceButton.setImage(UIImage(named: "Marketplace")!.maskWithColor(color: .gray), for: .normal)
        marketplaceButton.translatesAutoresizingMaskIntoConstraints = false
        marketplaceButton.tag = 3
        marketplaceButton.addTarget(self, action: #selector(changeTab(sender:)), for: .touchUpInside)
        navigation.addArrangedSubview(marketplaceButton)
        
        groupsButton.setImage(UIImage(named: "Groups")!.maskWithColor(color: .gray), for: .normal)
        groupsButton.translatesAutoresizingMaskIntoConstraints = false
        groupsButton.tag = 4
        groupsButton.addTarget(self, action: #selector(changeTab(sender:)), for: .touchUpInside)
        navigation.addArrangedSubview(groupsButton)
        
        selectedTab.backgroundColor = .systemBlue
        selectedTab.translatesAutoresizingMaskIntoConstraints = false
        navigation.addSubview(selectedTab)
        NSLayoutConstraint.activate([
            selectedTab.leadingAnchor.constraint(equalTo: homeButton.leadingAnchor),
            selectedTab.trailingAnchor.constraint(equalTo: homeButton.trailingAnchor),
            selectedTab.heightAnchor.constraint(equalToConstant: 2),
            selectedTab.bottomAnchor.constraint(equalTo: navigation.bottomAnchor)
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
                    NSLayoutConstraint.deactivate([
                        selectedTab.leadingAnchor.constraint(equalTo: homeButton.leadingAnchor),
                        selectedTab.trailingAnchor.constraint(equalTo: homeButton.trailingAnchor)
                    ])
                    selectedTab.removeFromSuperview()
                case .Friends:
                    friendsButton.setImage(UIImage(named: "Friends")!.maskWithColor(color: .gray), for: .normal)
                    NSLayoutConstraint.deactivate([
                        selectedTab.leadingAnchor.constraint(equalTo: friendsButton.leadingAnchor),
                        selectedTab.trailingAnchor.constraint(equalTo: friendsButton.trailingAnchor)
                    ])
                    selectedTab.removeFromSuperview()
                case .Watch:
                    watchButton.setImage(UIImage(named: "Watch")!.maskWithColor(color: .gray), for: .normal)
                    NSLayoutConstraint.deactivate([
                        selectedTab.leadingAnchor.constraint(equalTo: watchButton.leadingAnchor),
                        selectedTab.trailingAnchor.constraint(equalTo: watchButton.trailingAnchor)
                    ])
                    selectedTab.removeFromSuperview()
                case .Marketplace:
                    marketplaceButton.setImage(UIImage(named: "Marketplace")!.maskWithColor(color: .gray), for: .normal)
                    NSLayoutConstraint.deactivate([
                        selectedTab.leadingAnchor.constraint(equalTo: marketplaceButton.leadingAnchor),
                        selectedTab.trailingAnchor.constraint(equalTo: marketplaceButton.trailingAnchor)
                    ])
                    selectedTab.removeFromSuperview()
                case .Groups:
                    groupsButton.setImage(UIImage(named: "Groups")!.maskWithColor(color: .gray), for: .normal)
                    NSLayoutConstraint.deactivate([
                        selectedTab.leadingAnchor.constraint(equalTo: groupsButton.leadingAnchor),
                        selectedTab.trailingAnchor.constraint(equalTo: groupsButton.trailingAnchor)
                    ])
                    selectedTab.removeFromSuperview()
            }
            
            switch newSelection {
                case .Home:
                    homeButton.setImage(UIImage(named: "Home")!.maskWithColor(color: .systemBlue), for: .normal)
                    navigation.addSubview(selectedTab)
                    NSLayoutConstraint.activate([
                        selectedTab.leadingAnchor.constraint(equalTo: homeButton.leadingAnchor),
                        selectedTab.trailingAnchor.constraint(equalTo: homeButton.trailingAnchor)
                    ])
                case .Friends:
                    friendsButton.setImage(UIImage(named: "Friends")!.maskWithColor(color: .systemBlue), for: .normal)
                    navigation.addSubview(selectedTab)
                    NSLayoutConstraint.activate([
                        selectedTab.leadingAnchor.constraint(equalTo: friendsButton.leadingAnchor),
                        selectedTab.trailingAnchor.constraint(equalTo: friendsButton.trailingAnchor)
                    ])
                case .Watch:
                    watchButton.setImage(UIImage(named: "Watch")!.maskWithColor(color: .systemBlue), for: .normal)
                    navigation.addSubview(watchButton)
                    NSLayoutConstraint.activate([
                        selectedTab.leadingAnchor.constraint(equalTo: watchButton.leadingAnchor),
                        selectedTab.trailingAnchor.constraint(equalTo: watchButton.trailingAnchor)
                    ])
                case .Marketplace:
                    marketplaceButton.setImage(UIImage(named: "Marketplace")!.maskWithColor(color: .systemBlue), for: .normal)
                    navigation.addSubview(marketplaceButton)
                    NSLayoutConstraint.activate([
                        selectedTab.leadingAnchor.constraint(equalTo: marketplaceButton.leadingAnchor),
                        selectedTab.trailingAnchor.constraint(equalTo: marketplaceButton.trailingAnchor)
                    ])
                case .Groups:
                    groupsButton.setImage(UIImage(named: "Groups")!.maskWithColor(color: .systemBlue), for: .normal)
                    navigation.addSubview(groupsButton)
                    NSLayoutConstraint.activate([
                        selectedTab.leadingAnchor.constraint(equalTo: groupsButton.leadingAnchor),
                        selectedTab.trailingAnchor.constraint(equalTo: groupsButton.trailingAnchor)
                    ])
            }
            
            selected = newSelection
            delegate?.changeTab(changeTo: selected)
        }
    }
}

extension UIImage {
    func maskWithColor(color: UIColor) -> UIImage? {
    
        let maskImage = self.cgImage
        let width = self.size.width
        let height = self.size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
    
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let bitmapContext = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue) //needs rawValue of bitmapInfo
    
        bitmapContext!.clip(to: bounds, mask: maskImage!)
        bitmapContext!.setFillColor(color.cgColor)
        bitmapContext!.fill(bounds)
    
        //is it nil?
        if let cImage = bitmapContext!.makeImage() {
            let coloredImage = UIImage(cgImage: cImage)
        
            return coloredImage
        
        } else {
            return nil
        }
    }
}
