//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/9/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import Foundation


struct WeatherListViewModel {
    private var weatherViewModels: [WeatherViewModel]
}

struct WeatherViewModel: Decodable {
    let name: String
    let currentTemperature: TemperatureMainViewModel
    let weatherDetail: [WeatherDetailViewModel]
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case currentTemperature = "main"
        case weatherDetail = "weather"
    }
}

struct TemperatureMainViewModel: Decodable {
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}

struct WeatherDetailViewModel: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
