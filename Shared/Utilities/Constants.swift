//
//  Constants.swift
//  Artable
//
//  Created by Matthew Sutton on 1/10/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit

struct Storyboard {
    static let LoginStoryboard = "Login"
    static let Main = "Main"
}

struct StoryboardID {
    static let LoginVC = "LoginVC"
}

struct AppImages {
    static let GreenCheck = "green_check"
    static let RedCheck = "red_check"
}

struct AppColors {
    static let Blue = #colorLiteral(red: 0.2914361954, green: 0.3395442367, blue: 0.4364506006, alpha: 1)
    static let Red = #colorLiteral(red: 0.8739202619, green: 0.4776076674, blue: 0.385545969, alpha: 1)
    static let OffWhite = #colorLiteral(red: 0.9626371264, green: 0.959995091, blue: 0.9751287103, alpha: 1)
}

struct Identifiers {
    static let CategoryCell = "CategoryCell"
    static let ProductCell = "ProductCell"
}

struct Segues {
    static let ToProducts = "toProductsVC"
}
