//
//  your_weatherApp.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

@main
struct your_weatherApp: App {
    @StateObject private var localFeedbackViewModel = LocalFeedbackViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(localFeedbackViewModel)
        }
    }
}
