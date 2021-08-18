//
//  HomeViewController.swift
//  FacebookClone
//
//  Created by Brandon B on 8/16/21.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(white: 0.9, alpha: 1)
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: ((view.frame.width * 0.75) + (view.frame.width / 3 - 8.75) * 0.75) - 38)
        
        let postCollectionView = PostCollectionView(frame: self.view.frame, collectionViewLayout: layout)
        view.addSubview(postCollectionView)
    }
}

import SwiftUI

struct MainPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        typealias UIViewControllerType = HomeViewController

        func makeUIViewController(context: Context) -> HomeViewController {
            HomeViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            return
        }
    }
}
