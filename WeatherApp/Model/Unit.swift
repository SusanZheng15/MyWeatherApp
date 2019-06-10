//
//  Unit.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/10/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import Foundation


enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch(self) {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
    
}
