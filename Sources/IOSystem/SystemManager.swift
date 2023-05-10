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

#if canImport(AppKit)
import AppKit
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
    
    public static var deviceName: String {
        #if os(iOS)
        ModelType.allTypes.first { $0.key == deviceType }?.value.name ?? DeviceName.unknown.name
        #else
        "\(getMac()) (\(macSize()))"
        #endif
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


// MARK: - macOS

#if os(macOS)
extension SystemManager {
    static private func getMac() -> String {
        let versionCode = getVersionCode()
        
        if versionCode.hasPrefix("MacPro") {
            return MacType.macPro.name
        } else if versionCode.hasPrefix("iMac") {
            return MacType.iMac.name
        } else if versionCode.hasPrefix("MacBookPro") {
            return MacType.macBookPro.name
        } else if versionCode.hasPrefix("MacBookAir") {
            return MacType.macBookAir.name
        } else if versionCode.hasPrefix("MacBook") {
            return MacType.macBook.name
        } else if versionCode.hasPrefix("MacMini") {
            return MacType.macMini.name
        }
        
        return MacType.unknown.name
    }
    
    static private func getVersionCode() -> String {
        var size: Int = 0
        sysctlbyname("hw.model", nil, &size, nil, 0)
        
        var model = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.model", &model, &size, nil, 0)
        
        return String.init(validatingUTF8: model) ?? ""
    }
    
    static public func macSize() -> String {
        switch sizeInInches() {
        case 11:
            return MacSize.screen11Inch.title
        case 12:
            return MacSize.screen12Inch.title
        case 13:
            return MacSize.screen13Inch.title
        case 14:
            return MacSize.screen14Inch.title
        case 15:
            return MacSize.screen15Inch.title
        case 16:
            return MacSize.screen16Inch.title
        case 17:
            return MacSize.screen17Inch.title
        case 20:
            return MacSize.screen20Inch.title
        case 21:
            return MacSize.screen21_5Inch.title
        case 24:
            return MacSize.screen24Inch.title
        case 27:
            return MacSize.screen27Inch.title
        default:
            return MacSize.unknown.title
        }
    }
    
    private static func sizeInInches() -> CGFloat {
        let screen = NSScreen.screens.first { $0.localizedName.contains("Built-in") }
        let description = screen?.deviceDescription
        let displayPhysicalSize = CGDisplayScreenSize(description?[NSDeviceDescriptionKey(rawValue: "NSScreenNumber")] as? CGDirectDisplayID ?? 0)
        
        return floor(sqrt(pow(displayPhysicalSize.width, 2) + pow(displayPhysicalSize.height, 2)) * 0.0393701)
    }
}
#endif
