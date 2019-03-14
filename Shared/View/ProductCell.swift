//
//  ProductCell.swift
//  Artable
//
//  Created by Matthew Sutton on 3/4/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCell: UITableViewCell {

    @IBOutlet var productImg: RoundedImageView!
    @IBOutlet var productTitle: UILabel!
    @IBOutlet var productPrice: UILabel!
    @IBOutlet var favoriteBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(product: Product) {
        self.backgroundColor = .clear
        productTitle.text = product.name
        
        if let url = URL(string: product.imageURL) {
            productImg.kf.setImage(with: url)
        }
        
    }

    @IBAction func addToCartClicked(_ sender: Any) {
        
    }
    
    @IBAction func favoriteClicked(_ sender: Any) {
        
    }
    
}
