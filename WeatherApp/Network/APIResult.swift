//
//  APIResult.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/7/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import Foundation

public enum APIResult<T: Decodable> {
    case success(T)
    case unAuthenticated
    case badUrl
    case couldNotParseJSONData
    case noInternetConnection
    case serverError
    case notFound
    case clientError
    case other(rawError: Error)
}
