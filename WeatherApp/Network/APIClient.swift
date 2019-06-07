//
//  APIClient.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/7/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    
    private init() {}
    
    func getResult(completion: @escaping (APIResult<Weather>) -> Void){
        NetworkManager.shared.getRequest(urlString: "https://newsapi.org/v2/everything?q=apple&from=2019-06-05&to=2019-06-05&sortBy=popularity&apiKey=0d121252364d4600b75f97dffcbc2984", completion: completion)
    }
}
