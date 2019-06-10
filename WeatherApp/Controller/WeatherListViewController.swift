//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/7/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import UIKit
import MapKit

class WeatherListViewController: UITableViewController {

    var locationManager = CLLocationManager()
    var currentLocationWeatherVM: WeatherViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationUI()
        locationManager.requestWhenInUseAuthorization()
        
//        APIClient.shared.getWeatherResult(location: "miami,us") { (result) in
//            DispatchQueue.main.async(execute: {
//                switch result {
//                case .success(let weather):
//                    print(weather)
//                default:
//                    break
//                }
//            })
//        }
//
        setUpTableView()
        getUsersLocation()
    }
    
    private func setUpTableView(){
        self.tableView.register(WeatherTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    private func getUsersLocation(){
        var currentLocation: CLLocation?
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways{
            currentLocation = locationManager.location
            if let location = currentLocation{
                APIClient.shared.getWeatherResultByLatAndLong(latitude: location.coordinate.latitude, longitutde: location.coordinate.longitude) {[weak self] result in
                    DispatchQueue.main.async(execute: {
                        switch result {
                        case .success(let weather):
                            self?.currentLocationWeatherVM = weather
                            self?.tableView.reloadData()
                        default:
                            AppUtility.shared.handleAPIResultError(result)
                            break
                        }
                    })
                }
            }
            
        } else {
            AppUtility.shared.showAlert("Location not found", message: "Please allow this App to locate your current location in your settings", vc: self, actionTitle: "Dismiss")
        }
    }
    
    private func setNavigationUI(){
        self.title = "My Weathers"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressedAddWeather))
        let settingButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(pressedSetting))
        addBarButton.tintColor = .white
        settingButton.tintColor = .white
        self.navigationItem.setRightBarButton(addBarButton, animated: false)
        self.navigationItem.setLeftBarButton(settingButton, animated: false)
    }

    @objc private func pressedAddWeather() {
        print("added")
    }
    
    @objc private func pressedSetting() {
        print("setting")
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.tableView.frame.size.height / 4
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? WeatherTableViewHeader
        headerCell?.setCurrentLocations(weather: currentLocationWeatherVM)
        return headerCell
    }
}

