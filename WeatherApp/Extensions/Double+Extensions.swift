//
//  Double+Extensions.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/10/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import Foundation


extension Double {
    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }
}
