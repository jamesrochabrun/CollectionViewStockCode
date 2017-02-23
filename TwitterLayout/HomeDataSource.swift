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
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        
//        var users = [User]()
//        if  let array = json["users"].array {
//            for userJson in array {
//                let user = User(json: userJson)
//                users.append(user)
//            }
//        }
//        self.users = users
        //USING A MAP FUNCTION TO PARSE JSON
        let usersJsonArray = json["users"].array  //else {return }
        self.users = usersJsonArray!.map({User(json: $0)})
        
        let tweetsJsonArray = json["tweets"].array
        self.tweets = tweetsJsonArray!.map({Tweet(json: $0)})

//        var tweets = [Tweet]()
//        if let tweetsJsonArray = json["tweets"].array {
//            for tweetJson in tweetsJsonArray {
//                let tweet = Tweet(json: tweetJson)
//                tweets.append(tweet)
//            }
//        }
//        self.tweets = tweets
    }
    
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








