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
    @State private var isShowingSuccessMessage = false
    
    @StateObject private var viewModel = WeatherViewModel()
    
    @Environment(\.dismiss) var dismiss  // 이전 화면으로 돌아가는 기능
    
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
                // 등록 일자
                let currentDate = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                formatter.locale = Locale(identifier: "ko_KR")
                formatter.timeZone = TimeZone.current

                let formattedDate = formatter.string(from: currentDate)
                
                // 날씨 데이터와 체감정보를 딕셔너리로 결합
                let weatherData: [String: Any] = [
                    "date": formattedDate,
                    "city": viewModel.cityName,
                    "time": viewModel.currentTime,
                    "temperature": viewModel.currentTemp,
                    "description": viewModel.weatherDescription,
                    "min_temp": viewModel.dailyMinTemp,
                    "max_temp": viewModel.dailyMaxTemp,
                    "feels_like": viewModel.feelsLikeTemp,
                    "wind": viewModel.windSpeed,
                    "clouds": viewModel.cloudiness,
                    "humidity": viewModel.humidity,
                    "sunrise": viewModel.sunrise,
                    "sunset": viewModel.sunset,
                    "user_rating": rating
                ]
                
                // 서버에 데이터 삽입 요청
                addWeatherFeedback(weatherData: weatherData)
                
                // 알림창을 표시하고 서버 요청 후 알림창 호출
                isShowingSuccessMessage = true  // 알림창 표시
            } else {
                isShowingAlert = true
            }
        })
        .alert("등록 완료", isPresented: $isShowingSuccessMessage) {
            Button("확인", role: .cancel) {
                dismiss()  // 알림창 확인 버튼 클릭 시 이전 화면으로 돌아가기
            }
        } message: {
            Text("체감 정보를 등록하였습니다.")
        }
        .alert("버튼 선택", isPresented: $isShowingAlert) {
            Button("확인", role: .cancel) { }
        } message: {
            Text("날씨 체감 버튼을 선택해주세요.")
        }
    }
}

#Preview {
    WeatherSaveView()
}
