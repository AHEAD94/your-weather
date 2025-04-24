//
//  HomePage.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HeaderMessage()
                    
                    // 현재 날씨
                    ZStack(alignment: .topTrailing) {
                        WeatherView()
                        PlusButton()
                    }
                    WeatherDetailView()
                    
                    FooterMessage()
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.bottom)
                .onAppear {
                    weatherViewModel.fetchWeather(city: "Seoul")
                }
            }
        }
        .environmentObject(weatherViewModel)
    }
}

#Preview {
    HomePage()
}
