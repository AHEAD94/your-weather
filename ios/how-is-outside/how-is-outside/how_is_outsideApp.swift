//
//  how_is_outsideApp.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

@main
struct how_is_outsideApp: App {
    @StateObject private var localFeedbackViewModel = LocalFeedbackViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(localFeedbackViewModel)
        }
    }
}
