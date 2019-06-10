//
//  SavedWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/10/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import UIKit
import SDWebImage

class SavedWeatherTableViewCell: UITableViewCell {

    lazy var locationName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "AvenirNext-Medium", size: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var weatherIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubView() {
        selectionStyle = .none
        addSubview(locationName)
        locationName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        locationName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        locationName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(temperatureLabel)
        temperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(weatherIcon)
        weatherIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        weatherIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        weatherIcon.trailingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor, constant: -10).isActive = true
    }
    
    func setWeather(_ weatherVM: WeatherViewModel){
        locationName.text = weatherVM.name
        temperatureLabel.text = "\(weatherVM.currentTemperature.temperature.formatAsDegree)"
        if let weather = weatherVM.weatherDetail.first{
            if let url = URL(string: "http://openweathermap.org/img/w/\(weather.icon).png"){
                weatherIcon.sd_setImage(with: url, completed: nil)
            }
        }
        
    }
}
