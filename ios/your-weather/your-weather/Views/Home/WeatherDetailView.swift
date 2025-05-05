//
//  WeatherDetailView.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 4/19/25.
//

import SwiftUI

struct WeatherDetailView: View {
    // HomePage의 viewModel을 전달받아 사용
    @EnvironmentObject var weatherViewModel : WeatherViewModel
    
    var body: some View {
        VStack(spacing: 7) {
            Text("바람: \(weatherViewModel.formattedWindSpeed)")
            Text("습도: \(weatherViewModel.formattedHumidity)")
            Text("구름: \(weatherViewModel.formattedCloudiness)")
            HStack {
                Text("일출: \(weatherViewModel.formattedSunrise)")
                Text("일몰: \(weatherViewModel.formattedSunset)")
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
