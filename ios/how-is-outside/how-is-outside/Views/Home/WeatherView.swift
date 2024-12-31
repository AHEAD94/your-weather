//
//  WeatherView.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 7) {
            Text("\(viewModel.cityName)")
                .font(.largeTitle)
            Text("\(viewModel.currentTime)")
                .font(.subheadline)
            Text("\(viewModel.currentTemp)")
                .font(.largeTitle)
            Text("\(viewModel.weatherDescription)")
                .font(.title)
            HStack {
                Text("최저: \(viewModel.dailyMinTemp)")
                Text("최고: \(viewModel.dailyMaxTemp)")
            }
            Text("체감 온도: \(viewModel.feelsLikeTemp)")
            Text("바람: \(viewModel.windSpeed)")
            Text("구름: \(viewModel.cloudiness)")
            Text("습도: \(viewModel.humidity)")
            HStack {
                Text("일출: \(viewModel.sunrise)")
                Text("일몰: \(viewModel.sunset)")
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
