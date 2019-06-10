//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/9/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import Foundation


struct WeatherListViewModel {
    private var weatherViewModels: [WeatherViewModel] = []
}

struct WeatherViewModel: Decodable {
    let main: TemperatureMainViewModel
    let weatherDetail: WeatherDetailViewModel
}

struct TemperatureMainViewModel: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct WeatherDetailViewModel: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
