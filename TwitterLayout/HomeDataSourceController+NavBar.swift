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
        
        ///removing the shado from the bottom navbar and customizing it
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = UIColor.lightGray
        view.addSubview(navBarSeparatorView)
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        setUpRightNavItems()
        setUpLeftNavItems()
        setUpRemainingNavItems()
        
        
        let screenHeight = UIScreen.main.bounds.size.height
        let screenViewFrameHeight = view.frame.size.height
        let screenViewBoundHeight = view.bounds.size.height
        let collectionframeheight = collectionView?.frame.size.height
        let collectioBoundsheight = collectionView?.bounds.size.height
        
        
        print("screenHeight = \(screenHeight) \nscreenViewFrameHeight = \(screenViewFrameHeight) \nscreenViewBoundHeight = \(screenViewBoundHeight) \ncollectionframeheight = \(collectionframeheight) /ncollectioBoundsheight = \(collectioBoundsheight)")
    }
    
    private func setUpRightNavItems() {
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "zoom").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "ink").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: searchButton), UIBarButtonItem(customView: composeButton)]
    }
    
    private func setUpLeftNavItems() {
        
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "profile").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setUpRemainingNavItems() {
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "twitter"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView?.bounds = titleImageView.frame //THIS FIX NEED RESEARCH
        navigationItem.titleView = titleImageView
    }
}





