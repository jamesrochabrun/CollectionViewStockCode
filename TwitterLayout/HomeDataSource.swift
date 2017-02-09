//
//  HomeDataSource.swift
//  TwitterLayout
//
//  Created by James Rochabrun on 1/31/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let users: [User] = {
        let jamesUser = User(name: "james", username: "james123", bioText: "iosdev", profileImage:#imageLiteral(resourceName: "james"))
        let sasha = User(name: "sasha", username: "@sasha", bioText: "linda esto es un est necesito saber la estimacion de la altura de la celda para medir esto  ;kdjfh;wh ;jke h;jkwh ;wejkh we;h we;fjkh we;kfh w;efjkh w;ekfjh we;jkh we;jkfh we;kjh w;ekh w;ekfjh w;h ejkwf ek;h kjwhf ;jkwehf jkwehf jkwehf; khwef;k jhwef;k hwe;fkh  ;wkjhf ;kejwhf ;ejkwhf ;kh ;jkwhefjk hwefk; j", profileImage:#imageLiteral(resourceName: "james"))
        return [jamesUser, sasha]
    }()
    
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








