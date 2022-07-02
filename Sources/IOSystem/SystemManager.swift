//
//  SystemManager.swift
//  
//
//  Created by Kevin Waltz on 02.07.22.
//

import Foundation

public class SystemManager {
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
