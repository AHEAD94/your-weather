//
//  WeatherView.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack {
            Text("종일 날씨")
                .font(.largeTitle)
                .bold()
            Text("맑음, 25°C")
                .font(.title2)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 320)
        .padding()
        .background(Color.blue.opacity(0.7))
        .cornerRadius(12)
    }
}

#Preview {
    WeatherView()
}
