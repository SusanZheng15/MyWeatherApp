//
//  SettingsViewModel.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/10/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import Foundation
import UIKit


struct SettingsViewModel {
    let units = Unit.allCases
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return units.count
    }
    
    func unitAtIndex(_ index: Int) -> Unit {
        return units[index]
    }
}
