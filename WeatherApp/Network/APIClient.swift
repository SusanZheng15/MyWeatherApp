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
    
    func getWeatherResult(location: String, completion: @escaping (APIResult<WeatherViewModel>) -> Void){
        NetworkManager.shared.getRequest(urlString: "api.openweathermap.org/data/2.5/weather?q=\(location)&APPID=069ee4f0e91f655db64be9aff8edd6fc&units=imperial", completion: completion)
    }
}
