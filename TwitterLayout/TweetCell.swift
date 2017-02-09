//
//  TweetCell.swift
//  TwitterLayout
//
//  Created by James Rochabrun on 2/8/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override func setupViews() {
         super.setupViews()
        backgroundColor = .white
        separatorLineView.isHidden = false
    }
}
