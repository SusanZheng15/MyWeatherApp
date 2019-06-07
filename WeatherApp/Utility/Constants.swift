//
//  Constants.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/7/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import Foundation

struct Constants {
    struct Strings {
        static let generalAPIError: String = "Opps! Looks like something went wrong. Please try again later"
        static let serverError: String = "Opps! Looks like something went wrong connecting to the server. Please try again later"
        static let noInternetConnection: String = "No Internet connections found"
        
        static let generalErrorTitle: String = "Opps!"
        static let dismiss: String = "Dismiss"
    }
    
    struct cellIdentifier {
        static let articleTableViewCell: String = "ArticleTableViewCell"
    }
}
