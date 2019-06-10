//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/7/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import UIKit

class WeatherListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationUI()
    }

    private func setNavigationUI(){
        self.title = "My Weathers"
    }

}

