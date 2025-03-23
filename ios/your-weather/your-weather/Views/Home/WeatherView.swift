//
//  WeatherView.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct WeatherView: View {
    // HomePage의 viewModel을 전달받아 사용
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 7) {
            Text("\(weatherViewModel.cityName)")
                .font(.largeTitle)
            Text("\(weatherViewModel.formattedTime)")
                .font(.subheadline)
            Text("\(weatherViewModel.formattedTemperature)")
                .font(.largeTitle)
            Text("\(weatherViewModel.weatherDescription)")
                .font(.title)
            HStack {
                Text("최저: \(weatherViewModel.formattedDailyMinTemp)")
                Text("최고: \(weatherViewModel.formattedDailyMaxTemp)")
            }
            Text("체감 온도: \(weatherViewModel.formattedFeelsLike)")
            Text("바람: \(weatherViewModel.formattedWindSpeed)")
            Text("구름: \(weatherViewModel.formattedCloudiness)")
            Text("습도: \(weatherViewModel.formattedHumidity)")
            HStack {
                Text("일출: \(weatherViewModel.formattedSunrise)")
                Text("일몰: \(weatherViewModel.formattedSunset)")
            }
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
