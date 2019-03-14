//
//  Product.swift
//  Artable
//
//  Created by Matthew Sutton on 3/4/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Product {
    var name: String
    var id: String
    var category: String
    var price: Double
    var productDescription: String
    var imageURL: String
    var timeStamp: Timestamp
    var stock: Int
    var favorite: Bool
}
