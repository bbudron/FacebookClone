//
//  FavoritesTableView.swift
//  FacebookClone
//
//  Created by Brandon B on 8/22/21.
//

import UIKit

class FavoritesTableView: UITableView, UITableViewDelegate {
    var headerView: UIView!
    
    override init(frame: CGRect, style: UITableView.Style) {
        headerView = UIView()
        super.init(frame: frame, style: style)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    deinit {
        headerView = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView.backgroundColor = .systemPink
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(60)
    }    
}
