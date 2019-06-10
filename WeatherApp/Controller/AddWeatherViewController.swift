//
//  AddWeatherViewController.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/9/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import UIKit

class AddWeatherViewController: UIViewController {

    lazy var locationTextField: UITextField = {
        let tf = UITextField()
        tf.clipsToBounds = true
        tf.placeholder = "Enter Location"
        tf.textAlignment = .center
        tf.textColor = .black
        tf.font = UIFont(name: "AvenirNext-Regular", size: 14)
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.black.cgColor
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    lazy var addWeatherButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: 44/255, green: 150/255, blue: 222/255, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Add Location", for: .normal)
        button.addTarget(self, action: #selector(didTapAddWeather), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var addedNewWeather: ((String)->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        setSubViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        addWeatherButton.layer.cornerRadius = addWeatherButton.frame.size.height / 2
        locationTextField.layer.cornerRadius = 5
    }
    
    private func setSubViews(){
        self.view.backgroundColor = .white
        view.addSubview(locationTextField)
        locationTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        locationTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        locationTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        locationTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -self.view.frame.size.height / 5).isActive = true
        
        view.addSubview(addWeatherButton)
        addWeatherButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        addWeatherButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addWeatherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addWeatherButton.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 20).isActive = true
    }
    
    @objc private func didTapAddWeather(){
        if let weatherText = locationTextField.text{
            if addedNewWeather != nil{
                addedNewWeather!(weatherText)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
