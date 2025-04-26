//
//  WeatherDetailView.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 4/19/25.
//

import SwiftUI

struct WeatherDetailView: View {
    // HomePage의 viewModel을 전달받아 사용
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: 7) {
            Text("바람: \(viewModel.windSpeed)")
            Text("습도: \(viewModel.humidity)")
            Text("구름: \(viewModel.cloudiness)")
            HStack {
                Text("일출: \(viewModel.sunrise)")
                Text("일몰: \(viewModel.sunset)")
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.7))
        .cornerRadius(12)
    }
}

#Preview {
    WeatherDetailView()
        .environmentObject(WeatherViewModel())
}
