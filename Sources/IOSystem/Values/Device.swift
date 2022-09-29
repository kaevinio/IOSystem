//
//  Device.swift
//  
//
//  Created by Kevin Waltz on 29.09.22.
//

import Foundation

public enum Device {
    case mac, iPad, iPhone, appleWatch, appleTV, unknown
    
    
    public var name: String {
        switch self {
        case .mac: return "Mac"
        case .iPad: return "iPad"
        case .iPhone: return "iPhone"
        case .appleWatch: return "Apple Watch"
        case .appleTV: return "Apple TV"
        case .unknown: return "Unknown"
        }
    }
}
