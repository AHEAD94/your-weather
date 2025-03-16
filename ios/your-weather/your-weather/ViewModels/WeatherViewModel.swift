//
//  WeatherViewModel.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var currentTime: String = ""
    @Published var currentTemp: String = ""
    @Published var feelsLikeTemp: String = ""
    @Published var humidity: String = ""
    @Published var windSpeed: String = ""
    @Published var cloudiness: String = ""
    @Published var dailyMinTemp: String = ""
    @Published var dailyMaxTemp: String = ""
    @Published var weatherDescription: String = ""
    @Published var cityName: String = ""
    @Published var sunrise: String = ""
    @Published var sunset: String = ""
    
    private let weatherService = WeatherService()
    private let weatherDataManager = WeatherDataManager.shared
    
    // 초기화 시 저장된 JSON 파일에서 데이터 로드
    init() {
        loadWeatherData()
    }

    // open API에서 날씨 데이터 가져오기
    func fetchWeather(city: String) {
        weatherService.fetchWeather(city: city) { [weak self] response in
            DispatchQueue.main.async {
                if let data = response {
                    self?.updateWeatherData(data)
                    self?.weatherDataManager.saveWeatherData(data)
                } else {
                    self?.clearWeatherData()
                }
            }
        }
    }
    
    private func updateWeatherData(_ data: WeatherResponse) {
        currentTime = formatUnixTime(data.dt)
        currentTemp = "\(data.main.temp)°C"
        feelsLikeTemp = "\(data.main.feels_like)°C"
        humidity = "\(data.main.humidity)%"
        windSpeed = "\(data.wind.speed)m/s"
        cloudiness = "\(data.clouds.all)%"
        dailyMinTemp = "\(data.main.temp_min)°C"
        dailyMaxTemp = "\(data.main.temp_max)°C"
        weatherDescription = data.weather.first?.description ?? "No description"
        cityName = data.name
        sunrise = formatUnixTime(data.sys.sunrise)
        sunset = formatUnixTime(data.sys.sunset)
    }
    
    // 날씨 데이터 초기화
    private func clearWeatherData() {
        currentTime = ""
        currentTemp = ""
        feelsLikeTemp = ""
        humidity = ""
        windSpeed = ""
        cloudiness = ""
        dailyMinTemp = ""
        dailyMaxTemp = ""
        weatherDescription = ""
        cityName = ""
        sunrise = ""
        sunset = ""
    }

    // 유닉스 타임을 시간 문자열로 변환
    private func formatUnixTime(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.timeZone = .current
        return formatter.string(from: date)
    }
    
    private func loadWeatherData() {
        if let data = weatherDataManager.loadWeatherData() {
            updateWeatherData(data)
        }
    }
}
