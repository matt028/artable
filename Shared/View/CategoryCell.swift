//
//  CategoryCell.swift
//  Artable
//
//  Created by Matthew Sutton on 3/4/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {

    @IBOutlet var categoryImg: UIImageView!
    @IBOutlet var categoryLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryImg.layer.cornerRadius = 5
        
    }
    
    func configureCell(category: Category) {
        categoryLbl.text = category.name
        if let url = URL(string: category.imageURL) {
            let placeholder = UIImage(named: "placeholder")
            categoryImg.kf.indicatorType = .activity
            let options: KingfisherOptionsInfo = [KingfisherOptionsInfoItem.transition(.fade(0.1))]
            categoryImg.kf.setImage(with: url, placeholder: placeholder, options: options)
        }
    }

}
