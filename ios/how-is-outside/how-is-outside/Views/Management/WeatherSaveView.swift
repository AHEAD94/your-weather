//
//  WeatherSaveView.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/30/24.
//

import SwiftUI

struct WeatherSaveView: View {
    @State private var selectedRating: String? = nil  // 상태를 관리
    @State private var isShowingAlert = false
    
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                // 현재 날씨
                WeatherView()
                    .padding(.top, 10)
                
                // 날씨 평가
                FeelsLikeRating(selectedRating: $selectedRating)  // 부모의 상태를 바인딩하여 전달
                
                Spacer()
                
                FooterMessage()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .padding(.bottom)
        }
        .navigationBarTitle("날씨 체감 등록", displayMode: .inline)
        .navigationBarItems(trailing: Button("확인") {
            if let rating = selectedRating {
                // 서버에 데이터 삽입 요청
                print("\(viewModel.cityName)")
                print("\(viewModel.currentTemp)")
                print("\(rating)")
            } else {
                isShowingAlert = true
            }
        })
        .alert("버튼 선택", isPresented: $isShowingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("날씨 체감 버튼을 선택해주세요.")
        }
    }
}

#Preview {
    WeatherSaveView()
}
