//
//  SettingsTableViewController.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/10/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    var settingsViewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        setupTableView()
    }

    private func setupTableView(){
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "settingCell")
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return settingsViewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.numberOfRowsInSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "AvenirNext-Regular", size: 16)
        cell.selectionStyle = .none
        cell.textLabel?.text = settingsViewModel.unitAtIndex(indexPath.row).displayName
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }

}
