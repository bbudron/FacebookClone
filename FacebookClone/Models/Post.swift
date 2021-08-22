//
//  Post.swift
//  FacebookClone
//
//  Created by Brandon B on 8/21/21.
//

import UIKit

struct Post: Codable {
    let id: String
    let name: String
    let date: String
    let title: String
    let profileImage: String
    let images: [String]
}
