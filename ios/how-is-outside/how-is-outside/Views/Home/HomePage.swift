//
//  HomePage.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct HomePage: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("밖에 어때")
                            .font(.system(.largeTitle, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                        Text("날씨 체감 Insight")
                            .font(.system(.body, weight: .medium))
                            .foregroundStyle(.secondary)
                    }
                    
                    // 현재 날씨
                    WeatherView()
                        .overlay(
                            PlusButton()
                                .offset(x: 155, y: -145)
                        )
                    
                    // 상태바
                    StatusBarView()
                    
                    // 비슷한 과거 의복 & 내 옷장
                    HStack {
                        PastWeatherView()
                        MyClosetView()
                    }
                    
                    VStack {
                        Text("날씨 체감 Insight")
                        Text("밖에 어때, How is Outside")
                    }
                    .font(.system(.footnote, weight: .regular))
                    .foregroundStyle(.secondary)
                    .padding(.top, 30)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.bottom)
                .onAppear {
                    viewModel.fetchWeather(city: "Seoul")
                }
            }
        }
    }
}

#Preview {
    HomePage()
}
