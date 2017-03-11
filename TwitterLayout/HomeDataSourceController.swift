//
//  HomeDataSourceController.swift
//  TwitterLayout
//
//  Created by James Rochabrun on 1/31/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON


class HomeDataSourceController: DatasourceController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "sory something went wrong"
        label.textAlignment = .center
        label.isHidden = true
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview() //lbta method
        
        collectionView?.backgroundColor = UIColor.lightGray
        setUpNavigationBarItems()
        Service.sharedInstance.fetchHomeFeed { (homeDataSource, error) in
            if let err = error {
                self.errorMessageLabel.isHidden = false
                
                if let apiError = err as? APIError<Service.JSONError> {
                    
                    if apiError.response?.statusCode != 200 {
                        self.errorMessageLabel.text = "Status code was not 200"
                    }
                }
            }
            self.datasource = homeDataSource
        }
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
        
        if indexPath.section == 0 {
            guard let user = datasource?.item(indexPath) as? User else {
                return .zero
            }
            let estimatedHeightForUserBioText = estimatedHeightFor(text: user.bioText)
            //66 to the heigh this is the height of the views that are on top of the textview in this case the padding + the hegiht of the label and usernam label
            return CGSize(width: view.frame.width, height: estimatedHeightForUserBioText + 66)
        } else if indexPath.section == 1 {
            guard let tweet = datasource?.item(indexPath) as? Tweet else {
                return .zero
            }
            let estimatedHeightForTweetMessage = estimatedHeightFor(text: tweet.message)
            return CGSize(width: view.frame.width, height: estimatedHeightForTweetMessage + 74)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    //CALCULATE CELL HEIGHT DYNAMICALLY
    private func estimatedHeightFor(text: String) -> CGFloat {
        
        //1 12 * 2 is the padding horizonatl and 50 is the width of the profile View
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        //2 here we put a big number for the height
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        //3 this attribute is the font that we set to the textview
        let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        //4 use this method
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
    }
    
    //handling landscape mode
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
}













