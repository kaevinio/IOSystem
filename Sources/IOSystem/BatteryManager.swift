//
//  File.swift
//  
//
//  Created by Kevin Waltz on 04.07.22.
//

#if os(iOS)
import UIKit

/// We currently only support reading the battery percentage on iOS
public class BatteryManager {
    
    public init() {
        // Needs to be set to true or the battery percentage could be read
        UIDevice.current.isBatteryMonitoringEnabled = true
    }
    
    
    public var batteryLevel: Float {
        UIDevice.current.batteryLevel * 100
    }
}
#endif
