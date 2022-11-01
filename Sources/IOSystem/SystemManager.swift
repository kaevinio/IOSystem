//
//  SystemManager.swift
//  
//
//  Created by Kevin Waltz on 02.07.22.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

public class SystemManager {
    public static var appName: String {
        Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String ?? "Unknown"
    }
    
    public static var locale: String {
        Locale.current.identifier
    }
    
    public static var platform: Platform {
        #if os(macOS)
        .macOS
        #elseif os(iOS)
        .iOS
        #elseif os(watchOS)
        .watchOS
        #elseif os(tvOS)
        .tvOS
        #else
        .unknown
        #endif
    }
    
    public static var systemVersion: String {
        "\(ProcessInfo.processInfo.operatingSystemVersion.majorVersion).\(ProcessInfo.processInfo.operatingSystemVersion.minorVersion)"
    }
    
    public static var appVersion: String {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        return appVersion ?? "0"
    }
    
    public static var appBuildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"
    }
    
    public static var device: Device {
        if platform == .iOS {
            #if canImport(UIKit)
            return UIDevice.current.userInterfaceIdiom == .pad ? .iPad : .iPhone
            #else
            return .iPhone
            #endif
        } else if platform == .macOS {
            return .mac
        } else if platform == .watchOS {
            return .appleWatch
        } else if platform == .tvOS {
            return .appleTV
        } else {
            return .unknown
        }
    }
    
    public static var deviceName: DeviceName {
        ModelType.allTypes.first { $0.key == deviceType }?.value ?? .unknown
    }
    
    public static var deviceType: String {
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
}
