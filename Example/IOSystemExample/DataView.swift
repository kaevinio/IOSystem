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
                            TextView(header: "Platform", info: SystemManager.platform)
                            TextView(header: "System Version", info: SystemManager.systemVersion)
                            TextView(header: "App Version", info: SystemManager.appVersion)
                            TextView(header: "Build Number", info: SystemManager.buildNumber)
                            TextView(header: "Model Name", info: SystemManager.modelName)
                            TextView(header: "Model Type", info: SystemManager.modelType)
                            TextView(header: "Operating System", info: SystemManager.operatingSystem)
                            TextView(header: "Locale", info: SystemManager.locale)
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
