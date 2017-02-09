//
//  HomeDataSourceController+NavBar.swift
//  TwitterLayout
//
//  Created by James Rochabrun on 2/8/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

extension HomeDataSourceController {
    
    func setUpNavigationBarItems() {
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        setUpRightNavItems()
        setUpLeftNavItems()
        setUpRemainingNavItems()
    }
    
    private func setUpRightNavItems() {
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "3dglasses").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "3dglasses").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: searchButton), UIBarButtonItem(customView: composeButton)]
    }
    
    private func setUpLeftNavItems() {
        
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "3dglasses").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setUpRemainingNavItems() {
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "3dglasses"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView?.bounds = titleImageView.frame //THIS FIX NEED RESEARCH
        navigationItem.titleView = titleImageView
    }
}





