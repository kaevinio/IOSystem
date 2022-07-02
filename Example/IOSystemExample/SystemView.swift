//
//  SystemView.swift
//  IOSystemExample
//
//  Created by Kevin Waltz on 02.07.22.
//

import SwiftUI
import IOSystem

struct SystemView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    TextView(header: "Platform", info: SystemManager.platform)
                    TextView(header: "System Version", info: SystemManager.systemVersion)
                    TextView(header: "App Version", info: SystemManager.appVersion)
                    TextView(header: "Build Number", info: SystemManager.buildNumber)
                    TextView(header: "Model Name", info: SystemManager.modelName)
                    TextView(header: "Operating System", info: SystemManager.operatingSystem)
                    TextView(header: "Locale", info: SystemManager.locale)
                }
                .padding(.vertical, 9)
                .padding(.horizontal, 18)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("IOSystem")
        }
        .navigationViewStyle(.stack)
    }
    
}
