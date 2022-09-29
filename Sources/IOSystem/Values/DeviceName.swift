//
//  DeviceName.swift
//  
//
//  Created by Kevin Waltz on 29.09.22.
//

import Foundation

public enum DeviceName: String, CaseIterable {
    case unknown,
         simulator,
         
         // iPhone
         iPhoneSE,
         iPhone7,
         iPhone7Plus,
         iPhone8,
         iPhone8Plus,
         iPhoneXGlobal,
         iPhoneXGSM,
         iPhoneXS,
         iPhoneXSMax,
         iPhoneXSMaxGlobal,
         iPhoneXR,
         iPhone11,
         iPhone11Pro,
         iPhone11ProMax,
         iPhoneSE2Gen,
         iPhone12Mini,
         iPhone12,
         iPhone12Pro,
         iPhone12ProMax,
         iPhone13Pro,
         iPhone13ProMax,
         iPhone13Mini,
         iPhone13,
         iPhoneSE3Gen,
         iPhone14,
         iPhone14Plus,
         iPhone14Pro,
         iPhone14ProMax,
         
         // iPad
         iPadPro97Wifi,
         iPadPro97WifiCell,
         iPadPro129Wifi,
         iPadPro129WifiCell,
         iPad2017,
         iPadProWifi2Gen,
         iPadProWifiCell2Gen,
         iPadPro1052Gen,
         iPadWifi6Gen,
         iPadWifiCell6Gen,
         iPad102Wifi7Gen,
         iPad102WifiCell7Gen,
         iPadPro11Wifi3Gen,
         iPadPro11Wifi3Gen1TB,
         iPadPro11WifiCell3Gen,
         iPadPro11WifiCell3Gen1TB,
         iPadPro129Wifi3Gen,
         iPadPro129Wifi3Gen1TB,
         iPadPro129WifiCell3Gen,
         iPadPro129WifiCell3Gen1TB,
         iPadPro11Wifi4Gen,
         iPadPro11WifiCell4Gen,
         iPadPro129Wifi4Gen,
         iPadPro129WifiCell4Gen,
         iPadMiniWifi5Gen,
         iPadMini5Gen,
         iPadAirWifi3Gen,
         iPadAir3Gen,
         iPadWifi8Gen,
         iPadWifiCell8Gen,
         iPadWifi9Gen,
         iPadWifiCell9Gen,
         iPadMiniWifi6Gen,
         iPadMiniWifiCell6Gen,
         iPadAirWifi4Gen,
         iPadAirWifiCell4Gen,
         iPadPro115Gen,
         iPadPro1295Gen,
         iPadAirWifi5Gen,
         iPadAirWifiCell5Gen
    
    
    public var name: String {
        switch self {
        case .unknown: return "Unknown"
        case .simulator: return "Simulator"
            
        // iPhone
        case .iPhoneSE: return "iPhone SE"
        case .iPhone7: return "iPhone 7"
        case .iPhone7Plus: return "iPhone 7 Plus"
        case .iPhone8: return "iPhone 8"
        case .iPhone8Plus: return "iPhone 8 Plus"
        case .iPhoneXGlobal: return "iPhone X Global"
        case .iPhoneXGSM: return "iPhone X GSM"
        case .iPhoneXS: return "iPhone XS"
        case .iPhoneXSMax: return "iPhone XS Max"
        case .iPhoneXSMaxGlobal: return "iPhone XS Max Global"
        case .iPhoneXR: return "iPhone XR"
        case .iPhone11: return "iPhone 11"
        case .iPhone11Pro: return "iPhone 11 Pro"
        case .iPhone11ProMax: return "iPhone 11 Pro Max"
        case .iPhoneSE2Gen: return "iPhone SE [2nd Gen]"
        case .iPhone12Mini: return "iPhone 12 Mini"
        case .iPhone12: return "iPhone 12"
        case .iPhone12Pro: return "iPhone 12 Pro"
        case .iPhone12ProMax: return "iPhone 12 Pro Max"
        case .iPhone13Pro: return "iPhone 13 Pro"
        case .iPhone13ProMax: return "iPhone 13 Pro Max"
        case .iPhone13Mini: return "iPhone 13 Mini"
        case .iPhone13: return "iPhone 13"
        case .iPhoneSE3Gen: return "iPhone SE [3rd Gen]"
        case .iPhone14: return "iPhone 14"
        case .iPhone14Plus: return "iPhone 14 Plus"
        case .iPhone14Pro: return "iPhone 14 Pro"
        case .iPhone14ProMax: return "iPhone 14 Pro Max"
        
        // iPad
        case .iPadPro97Wifi: return "iPad Pro (9.7, WiFi)"
        case .iPadPro97WifiCell: return "iPad Pro (9.7, WiFi + Cellular)"
        case .iPadPro129Wifi: return "iPad Pro (12.9, WiFi)"
        case .iPadPro129WifiCell: return "iPad Pro (12.9, WiFi + Cellular)"
        case .iPad2017: return "iPad (2017)"
        case .iPadProWifi2Gen: return "iPad Pro (WiFi) [2nd Gen]"
        case .iPadProWifiCell2Gen: return "iPad Pro (WiFi + Cellular) [2nd Gen]"
        case .iPadPro1052Gen: return "iPad Pro (10.5) [2nd Gen]"
        case .iPadWifi6Gen: return "iPad (WiFi) [6th Gen]"
        case .iPadWifiCell6Gen: return "iPad (WiFi+Cellular) [6th Gen]"
        case .iPad102Wifi7Gen: return "iPad (10.2, WiFi) [7th Gen]"
        case .iPad102WifiCell7Gen: return "iPad (10.2, WiFi+Cellular) [7th Gen]"
        case .iPadPro11Wifi3Gen: return "iPad Pro (11, WiFi) [3rd Gen]"
        case .iPadPro11Wifi3Gen1TB: return "iPad Pro (11, 1TB, WiFi) [3rd Gen]"
        case .iPadPro11WifiCell3Gen: return "iPad Pro (11, WiFi + Cellular) [3rd Gen]"
        case .iPadPro11WifiCell3Gen1TB: return "iPad Pro (11, 1TB, WiFi + Cellular) [3rd Gen]"
        case .iPadPro129Wifi3Gen: return "iPad Pro (12.9, WiFi) [3rd Gen]"
        case .iPadPro129Wifi3Gen1TB: return "iPad Pro (12.9, 1TB, WiFi) [3rd Gen]"
        case .iPadPro129WifiCell3Gen: return "iPad Pro (12.9, WiFi + Cellular) [3rd Gen]"
        case .iPadPro129WifiCell3Gen1TB: return "iPad Pro (12.9, 1TB, WiFi + Cellular) [3rd Gen]"
        case .iPadPro11Wifi4Gen: return "iPad Pro (11, WiFi) [4th Gen]"
        case .iPadPro11WifiCell4Gen: return "iPad Pro (11, WiFi + Cellular) [4th Gen]"
        case .iPadPro129Wifi4Gen: return "iPad Pro (12.9, WiFi) [4th Gen]"
        case .iPadPro129WifiCell4Gen: return "iPad Pro (12.9, WiFi + Cellular) [4th Gen]"
        case .iPadMiniWifi5Gen: return "iPad Mini (WiFi) [5th Gen]"
        case .iPadMini5Gen: return "iPad Mini [5th Gen]"
        case .iPadAirWifi3Gen: return "iPad Air (WiFi) [3rd Gen]"
        case .iPadAir3Gen: return "iPad Air [3rd Gen]"
        case .iPadWifi8Gen: return "iPad (WiFi) [8th Gen]"
        case .iPadWifiCell8Gen: return "iPad (WiFi + Cellular) [8th Gen]"
        case .iPadWifi9Gen: return "iPad (WiFi) [9th Gen]"
        case .iPadWifiCell9Gen: return "iPad (WiFi + Cellular) [9th Gen]"
        case .iPadMiniWifi6Gen: return "iPad Mini (WiFi) [6th Gen]"
        case .iPadMiniWifiCell6Gen: return "iPad Mini (WiFi + Cellular) [6th Gen]"
        case .iPadAirWifi4Gen: return "iPad Air (WiFi) [4th Gen]"
        case .iPadAirWifiCell4Gen: return "iPad Air (WiFi + Cellular) [4th Gen]"
        case .iPadPro115Gen: return "iPad Pro (11) [5th Gen]"
        case .iPadPro1295Gen: return "iPad Pro (12.9) [5th Gen]"
        case .iPadAirWifi5Gen: return "iPad Air (WiFi) [5th Gen]"
        case .iPadAirWifiCell5Gen: return "iPad Air (WiFi + Cellular) [5th Gen]"
        }
    }
}
