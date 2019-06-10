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
    var savedWeathersVM = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationUI()
        locationManager.requestWhenInUseAuthorization()
        setUpTableView()
        getUsersLocation()
    }
    
    private func setUpTableView(){
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.register(WeatherTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        self.tableView.register(SavedWeatherTableViewCell.self, forCellReuseIdentifier: "cell")
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
        let vc = AddWeatherViewController()
        vc.addedNewWeather = {[weak self] location in
            APIClient.shared.getWeatherResult(location: location, completion: { [weak self] result in
                DispatchQueue.main.async(execute: {
                    switch result {
                    case .success(let weather):
                        self?.savedWeathersVM.addWeatherViewModel(weather)
                        self?.tableView.reloadData()
                        break
                    default:
                        AppUtility.shared.handleAPIResultError(result)
                        break
                    }
                })
            })
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func pressedSetting() {
        let vc = SettingsTableViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.tableView.frame.size.height / 4
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? WeatherTableViewHeader
        headerCell?.setCurrentLocations(weather: currentLocationWeatherVM)
        return headerCell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return savedWeathersVM.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedWeathersVM.numberOfRowInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SavedWeatherTableViewCell
        cell.setWeather(savedWeathersVM.weatherAtIndex(indexPath.row))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / 8
    }
}

