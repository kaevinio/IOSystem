//
//  SystemManager.swift
//  
//
//  Created by Kevin Waltz on 02.07.22.
//

import Foundation

public class SystemManager {
    public static var appName: String {
        Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String ?? "Unknown"
    }
    
    public static var platform: String {
        #if os(macOS)
        "macOS"
        #elseif os(iOS)
        "iOS"
        #elseif os(watchOS)
        "watchOS"
        #elseif os(tvOS)
        "tvOS"
        #else
        "Unknown Platform"
        #endif
    }
    
    public static var systemVersion: String {
        "\(ProcessInfo.processInfo.operatingSystemVersion.majorVersion).\(ProcessInfo.processInfo.operatingSystemVersion.minorVersion)"
    }
    
    public static var appVersion: String {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        return appVersion ?? "0"
    }
    
    public static var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"
    }
    
    public static var modelName: String {
        modelTypes.first { $0.key == modelType }?.value ?? "Unknown"
    }
    
    public static var modelType: String {
        if #available(iOS 14.0, watchOS 7.0, macOS 11, tvOS 14.0, *), ProcessInfo.processInfo.isiOSAppOnMac {
            var size = 0
            sysctlbyname("hw.model", nil, &size, nil, 0)
            var machine = [CChar](repeating: 0, count: size)
            sysctlbyname("hw.model", &machine, &size, nil, 0)
            return String(cString: machine)
        }
        
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return identifier
    }
    
    public static var operatingSystem: String {
        #if os(macOS)
        "macOS"
        #elseif os(iOS)
        "iOS"
        #elseif os(watchOS)
        "watchOS"
        #elseif os(tvOS)
        "tvOS"
        #else
        "Unknown Operating System"
        #endif
    }
    
    public static var locale: String {
        Locale.current.identifier
    }
}



// MARK: - Model Types and their respective title

extension SystemManager {
    fileprivate static let modelTypes: [String: String] = ["i386": "Simulator",
                                                           "x86_64": "Simulator",
                                                           "arm64": "Simulator",
                                                           "iPhone8,4": "iPhone SE",
                                                           "iPhone9,1": "iPhone 7",
                                                           "iPhone9,2": "iPhone 7 Plus",
                                                           "iPhone9,3": "iPhone 7",
                                                           "iPhone9,4": "iPhone 7 Plus",
                                                           "iPhone10,1": "iPhone 8",
                                                           "iPhone10,2": "iPhone 8 Plus",
                                                           "iPhone10,3": "iPhone X Global",
                                                           "iPhone10,4": "iPhone 8",
                                                           "iPhone10,5": "iPhone 8 Plus",
                                                           "iPhone10,6": "iPhone X GSM",
                                                           "iPhone11,2": "iPhone XS",
                                                           "iPhone11,4": "iPhone XS Max",
                                                           "iPhone11,6": "iPhone XS Max Global",
                                                           "iPhone11,8": "iPhone XR",
                                                           "iPhone12,1": "iPhone 11",
                                                           "iPhone12,3": "iPhone 11 Pro",
                                                           "iPhone12,5": "iPhone 11 Pro Max",
                                                           "iPhone12,8": "iPhone SE [2nd Gen]",
                                                           "iPhone13,1": "iPhone 12 Mini",
                                                           "iPhone13,2": "iPhone 12",
                                                           "iPhone13,3": "iPhone 12 Pro",
                                                           "iPhone13,4": "iPhone 12 Pro Max",
                                                           "iPhone14,2": "iPhone 13 Pro",
                                                           "iPhone14,3": "iPhone 13 Pro Max",
                                                           "iPhone14,4": "iPhone 13 Mini",
                                                           "iPhone14,5": "iPhone 13",
                                                           "iPhone14,6": "iPhone SE [3rd Gen]",
                                                           
                                                           "iPad6,3": "iPad Pro (9.7, WiFi)",
                                                           "iPad6,4": "iPad Pro (9.7, WiFi + LTE)",
                                                           "iPad6,7": "iPad Pro (12.9, WiFi)",
                                                           "iPad6,8": "iPad Pro (12.9, WiFi + LTE)",
                                                           "iPad6,11": "iPad (2017)",
                                                           "iPad6,12": "iPad (2017)",
                                                           "iPad7,1": "iPad Pro (WiFi) [2nd Gen]",
                                                           "iPad7,2": "iPad Pro (WiFi + Cellular) [2nd Gen]",
                                                           "iPad7,3": "iPad Pro (10.5) [2nd Gen]",
                                                           "iPad7,4": "iPad Pro (10.5) [2nd Gen]",
                                                           "iPad7,5": "iPad (WiFi) [6th Gen]",
                                                           "iPad7,6": "iPad (WiFi+Cellular) [6th Gen]",
                                                           "iPad7,11": "iPad (10.2, WiFi) [7th Gen]",
                                                           "iPad7,12": "iPad (10.2, WiFi+Cellular) [7th Gen]",
                                                           "iPad8,1": "iPad Pro (11, WiFi) [3rd Gen]",
                                                           "iPad8,2": "iPad Pro (11, 1TB, WiFi) [3rd Gen]",
                                                           "iPad8,3": "iPad Pro (11, WiFi + Cellular) [3rd Gen]",
                                                           "iPad8,4": "iPad Pro (11, 1TB, WiFi + Cellular) [3rd Gen]",
                                                           "iPad8,5": "iPad Pro (12.9, WiFi) [3rd Gen]",
                                                           "iPad8,6": "iPad Pro (12.9, 1TB, WiFi) [3rd Gen]",
                                                           "iPad8,7": "iPad Pro (12.9, WiFi + Cellular) [3rd Gen]",
                                                           "iPad8,8": "iPad Pro (12.9, 1TB, WiFi + Cellular) [3rd Gen]",
                                                           "iPad8,9": "iPad Pro (12.9, WiFi) [4th Gen]",
                                                           "iPad8,10": "iPad Pro (11, WiFi + Cellular) [4th Gen]",
                                                           "iPad8,11": "iPad Pro (12.9, WiFi) [4th Gen]",
                                                           "iPad8,12": "iPad Pro (12.9, WiFi + Cellular) [4th Gen]",
                                                           "iPad11,1": "iPad mini (WiFi) [5th Gen]",
                                                           "iPad11,2": "iPad mini [5th Gen]",
                                                           "iPad11,3": "iPad Air (WiFi) [3rd Gen]",
                                                           "iPad11,4": "iPad Air [3rd Gen]",
                                                           "iPad11,6": "iPad (WiFi) [8th Gen]",
                                                           "iPad11,7": "iPad (WiFi + Cellular) [8th Gen]",
                                                           "iPad12,1": "iPad (WiFi) [9th Gen]",
                                                           "iPad12,2": "iPad (WiFi + Cellular) [9th Gen]",
                                                           "iPad14,1": "iPad mini (WiFi) [6th Gen]",
                                                           "iPad14,2": "iPad mini (WiFi + Cellular) [6th Gen]",
                                                           "iPad13,1": "iPad Air (WiFi) [4th Gen]",
                                                           "iPad13,2": "iPad Air (WiFi + Cellular) [4th Gen]",
                                                           "iPad13,4": "iPad Pro (11) [5th Gen]",
                                                           "iPad13,5": "iPad Pro (11) [5th Gen]",
                                                           "iPad13,6": "iPad Pro (11) [5th Gen]",
                                                           "iPad13,7": "iPad Pro (11) [5th Gen]",
                                                           "iPad13,8": "iPad Pro (12.9) [5th Gen]",
                                                           "iPad13,9": "iPad Pro (12.9) [5th Gen]",
                                                           "iPad13,10": "iPad Pro (12.9) [5th Gen]",
                                                           "iPad13,11": "iPad Pro (12.9) [5th Gen]",
                                                           "iPad13,16": "iPad Air (WiFi) [5th Gen]",
                                                           "iPad13,17": "iPad Air (WiFi + Cellular) [5th Gen]"]
}
