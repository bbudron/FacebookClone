//
//  Post.swift
//  FacebookClone
//
//  Created by Brandon B on 8/21/21.
//

import UIKit

struct Post: Codable {
    let model: Int
    let index: Int
    let name: String
    let date: String
    let title: String
    let profileImage: String
    let images: [String]
}
