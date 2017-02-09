//
//  HomeDataSourceController.swift
//  TwitterLayout
//
//  Created by James Rochabrun on 1/31/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import LBTAComponents



class HomeDataSourceController: DatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.lightGray
        let homeDataSource = HomeDataSource()
        self.datasource = homeDataSource
        setUpNavigationBarItems()
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: view.frame.width, height: 50) : .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: view.frame.width, height: 64) : .zero
    }

    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
            
            //estimation of the height of the cell based on user.biotext
            
            //1 12 * 2 is the padding horizonatl and 50 is the width of the profile View
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            //2 here we put a big number for the height
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            //3 this attribute is the font that we set to the textview
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            //4 use this method
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            //5 add 66 to the heigh this is the height of the views that are on top of the textvied in this case the padding + the hegiht of the label and usernam label
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    //handling landscape mode
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
}













