//
//  WeatherView.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct WeatherView: View {
    // HomePage의 viewModel을 전달받아 사용
    @EnvironmentObject var weatherViewModel : WeatherViewModel
    
    var body: some View {
        VStack(spacing: 7) {
            Text("\(weatherViewModel.formattedTime)")
                .font(.subheadline)
            Text("\(weatherViewModel.cityName)")
                .font(.largeTitle)
            Text("\(weatherViewModel.weatherDescription)")
                .font(.title)
            Text("\(weatherViewModel.formattedTemperature)")
                .font(.largeTitle)
            HStack {
                Text("최저: \(weatherViewModel.formattedDailyMinTemp)")
                Text("최고: \(weatherViewModel.formattedDailyMaxTemp)")
            }
            Text("체감 온도: \(weatherViewModel.formattedFeelsLike)")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.7))
        .cornerRadius(12)
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherViewModel())
}
