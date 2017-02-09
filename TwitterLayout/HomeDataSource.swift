//
//  HomeDataSource.swift
//  TwitterLayout
//
//  Created by James Rochabrun on 1/31/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import LBTAComponents
import SwiftyJSON
import TRON

//this is the provider of data
class HomeDataSource: Datasource, JSONDecodable  {
    
    //2 create a model that will catch the succes json response
    let users: [User]
    
    required init(json: JSON) throws {
        
        var users = [User]()
        
        if  let array = json["users"].array {
            for userJson in array {
                let name = userJson["name"].stringValue
                let userName = userJson["username"].stringValue
                let bio = userJson["bio"].stringValue
                let user = User(name: name, username: userName, bioText: bio, profileImage: UIImage())
                users.append(user)
            }
        }
        self.users = users
    }
    
    lazy var tweets: [Tweet] = {
        let tweet1 = Tweet(user: self.users[0], message: "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500,")
        let tweet2 = Tweet(user: self.users[1], message: "El trozo de texto estándar de Lorem Ipsum usado desde el año 1500 es reproducido debajo para aquellos interesados. Las secciones 1.10.32 y 1.10.33 de de Finibus Bonorum et Malorum")
        return [tweet1, tweet2]
        
    }()
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    override func numberOfItems(_ section: Int) -> Int {
        return section == 0 ? users.count : tweets.count
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return indexPath.section == 0 ? users[indexPath.item] : tweets[indexPath.row]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    
}








