//
//  Device.swift
//  DevLab-Test
//
//  Created by Arsh Aulakh on 2017-04-25.
//  Copyright © 2017 AA. All rights reserved.
//

import Foundation

// MARK: Enums

enum DeviceOS {
    case iOS
    case Android
    case Windows
    case BlackberryOS
    case Other(String)
    
    var stringValue: String {
        switch self {
        case iOS:
            return "iOS"
        case Android:
            return "Android"
        case Windows:
            return "Windows"
        case Blackberry:
            return "Blackberry OS"
        case Other(let name):
            return name
        }
    }
}

enum DeviceType {
    case Phone
    case Tablet
    case Wearable
    case Other(String)
    
    var stringValue: String {
        switch self {
        case Phone:
            return "Phone"
        case Tablet:
            return "Tablet"
        case Wearable:
            return "Wearable"
        case Other(let name):
            return name
        }
    }
}

// MARK: Model

struct Device {
    var image: UIImage = UIImage(named: "icon-device")!
    var identifier: String
    var make: String
    var model: String
    var os: DeviceOS
    var type: DeviceType
}
