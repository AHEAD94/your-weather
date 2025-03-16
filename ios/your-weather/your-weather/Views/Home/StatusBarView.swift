//
//  StatusBarView.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct StatusBarView: View {
    var body: some View {
        HStack {
            Text("[적절]")
                .font(.headline)
            Text("다음 3시간동안 비슷한 정도를 유지해요")
                .font(.subheadline)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.green.opacity(0.7))
        .cornerRadius(12)
    }
}

#Preview {
    StatusBarView()
}
