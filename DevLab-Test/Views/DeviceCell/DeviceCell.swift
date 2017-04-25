//
//  DeviceCell.swift
//  DevLab-Test
//
//  Created by Arsh Aulakh on 2017-04-25.
//  Copyright © 2017 AA. All rights reserved.
//

import UIKit

struct DeviceViewModel {
    /// Properties
    var device: Device
    var addable: Bool
    
    /// Accessibility Properties
    var image: UIImage { return device.image }
    var identifier: String { return device.identifier }
    var make: String { return device.make }
    var model: String { return device.model }
    var os: String { return device.os.stringValue }
    var type: String { return device.type.stringValue }
}

class DeviceCell: UITableViewCell {
    
    // MARK: Properties
    /// Outlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var osLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    /// Variables
    var viewModel: DeviceViewModel! {
        didSet {
            configure(with: viewModel)
        }
    }
    
    // MARK: Configuration

    func configure(with viewModel: DeviceViewModel?) {
        guard let device = device else {
            /// Remove Data
            iconImageView.image = nil
            identifierLabel.text = nil
            makeLabel.text = nil
            modelLabel.text = nil
            osLabel.text = nil
            typeLabel.text = nil
            addButton.isHidden = true
            removeButton.isHidden = true
            
            return
        }
        
        iconImageView.image = viewModel.image
        identifierLabel.text = viewModel.identifier
        makeLabel.text = viewModel.make
        modelLabel.text = viewModel.model
        osLabel.text = viewModel.os
        typeLabel.text = viewModel.type
        addButton.isHidden = !viewModel.addable
        removeButton.isHidden = viewModel.addable
    }
}
