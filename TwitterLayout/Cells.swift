//
//  Cells.swift
//  TwitterLayout
//
//  Created by James Rochabrun on 1/31/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import LBTAComponents

class UserHeader: DatasourceCell {
    
    let textLabel: UILabel = {
       let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(textLabel)
        //textLabel.fillSuperview()
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class UserFooter: DatasourceCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.cyan
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)    }
}

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            nameLabel.text = datasourceItem as? String
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "james")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
       // imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "James"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@jamesrochabrun"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let bioTextView: UITextView = {
       let textView = UITextView()
        textView.text = "iphone ipad ios programming the best, now working in swift 3"
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.cyan.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(UIColor.cyan, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(#imageLiteral(resourceName: "3dglasses"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(userNameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        userNameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        bioTextView.anchor(userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
        
    }
}











