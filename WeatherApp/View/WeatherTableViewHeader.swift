//
//  WeatherTableViewHeader.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/9/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import UIKit

class WeatherTableViewHeader: UITableViewHeaderFooterView {

    lazy var locationName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Medium", size: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "AvenirNext-Medium", size: 26)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var weatherIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setSubView(){
        self.backgroundColor = .white
        addSubview(locationName)
        locationName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        locationName.topAnchor.constraint(equalTo: centerYAnchor, constant: -40).isActive = true
        locationName.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        addSubview(temperatureLabel)
        temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        temperatureLabel.topAnchor.constraint(equalTo: locationName.bottomAnchor, constant: 10).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        addSubview(weatherIcon)
        weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        weatherIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        weatherIcon.trailingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor, constant: -10).isActive = true
    }
    
    func setCurrentLocations(weather: WeatherViewModel?) {
        
        locationName.text = weather?.name
        if let temperature = weather{
            temperatureLabel.text = "\(temperature.currentTemperature.temperature.formatAsDegree)"
        }
        if let weather = weather?.weatherDetail.first{
            if let url = URL(string: "http://openweathermap.org/img/w/\(weather.icon).png"){
                weatherIcon.sd_setImage(with: url, completed: nil)
            }
        }
    }
}
