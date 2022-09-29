//
//  SystemView.swift
//  IOSystemExample
//
//  Created by Kevin Waltz on 02.07.22.
//

import SwiftUI
import IOSystem

struct DataView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 36) {
                    VStack(spacing: 8) {
                        Text("Battery")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 16) {
                            TextView(header: "Battery Level", info: "\(BatteryManager().batteryLevel)")
                        }
                    }
                    
                    VStack(spacing: 8) {
                        Text("System")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 16) {
                            TextView(header: "App Name", info: SystemManager.appName)
                            TextView(header: "Locale", info: SystemManager.locale)
                            TextView(header: "Platform", info: SystemManager.platform.rawValue)
                            TextView(header: "System Version", info: SystemManager.systemVersion)
                            TextView(header: "App Version", info: SystemManager.appVersion)
                            TextView(header: "App Build Number", info: SystemManager.appBuildNumber)
                            TextView(header: "Device", info: SystemManager.device.name)
                            TextView(header: "Device Name", info: SystemManager.deviceName.name)
                            TextView(header: "Device Type", info: SystemManager.deviceType)
                        }
                    }
                    
                    VStack(spacing: 8) {
                        Text("Storage")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 16) {
                            TextView(header: "Total Disk Space", info: "\(StorageManager.totalDiskSpaceInGB) GB")
                            TextView(header: "Used Disk Space", info: "\(StorageManager.usedDiskSpaceInGB) GB")
                            TextView(header: "Free Disk Space", info: "\(StorageManager.freeDiskSpaceInGB) GB")
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
            }
            .navigationTitle("IOSystem")
        }
        .navigationViewStyle(.stack)
    }
    
}
