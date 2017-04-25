//
//  CheckoutViewController.swift
//  DevLab-Test
//
//  Created by Arsh Aulakh on 2017-04-24.
//  Copyright © 2017 AA. All rights reserved.
//

import UIKit

class CheckoutViewController: UITableViewController {

    // MARK: Properties
    /// Outlets
    /// Variables
    var selectedDevices = Array(repeating: Device(), count:0)
    var availableDevices = Array(repeating: Device(), count:10)
    /// Constants
    let cellReuseIdentifier = "DeviceCell"
    
    // MARK: View Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Configure table
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = 120 ///UITableViewAutomaticDimension
        
        /// Register Cell
        let nib = UINib(nibName: DeviceCell.reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DeviceCell.reuseIdentifier)
    }
}

extension CheckoutViewController {
    
    // MARK: Configure Table
    /// Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? selectedDevices.count : availableDevices.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeviceCell.reuseIdentifier, for: indexPath) as! DeviceCell
        
        /// Configure Cell By Section
        if indexPath.section == 0 {
            cell.viewModel = DeviceCellViewModel(device: selectedDevices[indexPath.row], addable: false)
        } else {
            cell.viewModel = DeviceCellViewModel(device: availableDevices[indexPath.row], addable: true)
        }
        
        return cell
    }
    
    /// Delegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Selected Devices".capitalized : "Available Devices".capitalized
    }
}

extension CheckoutViewController {
    
    // MARK: Navigation
    
    @IBAction func dismissFilters(segue: UIStoryboardSegue) { }
    
    @IBAction func returnToCheckoutScreen(segue: UIStoryboardSegue) { }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
