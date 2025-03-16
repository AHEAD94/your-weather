//
//  ServerButton.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 1/4/25.
//

import SwiftUI

struct ServerButton: View {
    var body: some View {
        NavigationLink(destination: ServerHistoryList()) {
            Image(systemName: "externaldrive.badge.icloud")
                .font(.system(size: 25))
                .padding(.horizontal)
        }
    }
}

#Preview {
    ServerButton()
}
