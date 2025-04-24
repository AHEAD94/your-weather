//
//  WeatherView.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct WeatherView: View {
    // HomePage의 viewModel을 전달받아 사용
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 7) {
            Text("\(viewModel.currentTime)")
                .font(.subheadline)
            Text("\(viewModel.cityName)")
                .font(.largeTitle)
            Text("\(viewModel.weatherDescription)")
                .font(.title)
            Text("\(viewModel.currentTemp)")
                .font(.largeTitle)
            HStack {
                Text("최저: \(viewModel.dailyMinTemp)")
                Text("최고: \(viewModel.dailyMaxTemp)")
            }
            Text("체감 온도: \(viewModel.feelsLikeTemp)")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.7))
        .cornerRadius(12)
    }
}

#Preview {
    WeatherView()
}
