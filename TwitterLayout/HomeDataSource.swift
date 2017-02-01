//
//  HomeDataSource.swift
//  TwitterLayout
//
//  Created by James Rochabrun on 1/31/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let words = ["user1" , "user2"]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
}
