//
//  WeatherViewModel.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var time: Date = Date()
    @Published var temperature: Double = 0.0
    @Published var feelsLike: Double = 0.0
    @Published var humidity: Int = 0
    @Published var windSpeed: Double = 0.0
    @Published var cloudiness: Int = 0
    @Published var dailyMinTemp: Double = 0.0
    @Published var dailyMaxTemp: Double = 0.0
    @Published var weatherDescription: String = ""
    @Published var cityName: String = ""
    @Published var sunrise: Date = Date()
    @Published var sunset: Date = Date()

    private let weatherService = WeatherService()
    private let weatherDataManager = WeatherDataManager.shared

    // 초기화 시 저장된 JSON 파일에서 데이터 로드
    init() {
        loadWeatherData()
    }

    // 포맷된 값들 (뷰에서 사용할 데이터)
    var formattedTime: String {
        return time.formattedAsTime()
    }

    var formattedSunrise: String {
        return sunrise.formattedAsTime()
    }

    var formattedSunset: String {
        return sunset.formattedAsTime()
    }

    var formattedTemperature: String {
        return temperature.formattedAsTemperature()
    }

    var formattedFeelsLike: String {
        return feelsLike.formattedAsTemperature()
    }

    var formattedWindSpeed: String {
        return windSpeed.formattedAsWindSpeed()
    }

    var formattedDailyMinTemp: String {
        return dailyMinTemp.formattedAsTemperature()
    }

    var formattedDailyMaxTemp: String {
        return dailyMaxTemp.formattedAsTemperature()
    }

    var formattedHumidity: String {
        return humidity.formattedAsPercentage()
    }

    var formattedCloudiness: String {
        return cloudiness.formattedAsPercentage()
    }

    // 날씨 데이터 불러오기
    private func loadWeatherData() {
        if let data = weatherDataManager.loadWeatherData() {
            updateWeatherData(data)
        }
    }

    // 날씨 데이터 업데이트
    private func updateWeatherData(_ data: WeatherResponse) {
        time = Date(timeIntervalSince1970: TimeInterval(data.dt))
        temperature = data.main.temp
        feelsLike = data.main.feels_like
        humidity = data.main.humidity
        windSpeed = data.wind.speed
        cloudiness = data.clouds.all
        dailyMinTemp = data.main.temp_min
        dailyMaxTemp = data.main.temp_max
        weatherDescription = data.weather.first?.description ?? "No description"
        cityName = data.name
        sunrise = Date(timeIntervalSince1970: TimeInterval(data.sys.sunrise))
        sunset = Date(timeIntervalSince1970: TimeInterval(data.sys.sunset))
    }

    // 날씨 데이터 초기화
    private func clearWeatherData() {
        time = Date()
        temperature = 0.0
        feelsLike = 0.0
        humidity = 0
        windSpeed = 0.0
        cloudiness = 0
        dailyMinTemp = 0.0
        dailyMaxTemp = 0.0
        weatherDescription = ""
        cityName = ""
        sunrise = Date()
        sunset = Date()
    }

    // 날씨 데이터 API로부터 받아오기
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
}

extension Date {
    // 시간을 포맷팅하는 함수
    func formattedAsTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: self)
    }
}

extension Double {
    // 온도 형식화 함수
    func formattedAsTemperature() -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        formatter.numberStyle = .decimal
        return "\(formatter.string(from: NSNumber(value: self)) ?? "\(self)")°C"
    }

    // 풍속 형식화 함수
    func formattedAsWindSpeed() -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        formatter.numberStyle = .decimal
        return "\(formatter.string(from: NSNumber(value: self)) ?? "\(self)") m/s"
    }
}

extension Int {
    // 백분율 형식화 함수
    func formattedAsPercentage() -> String {
        return "\(self)%"
    }
}
