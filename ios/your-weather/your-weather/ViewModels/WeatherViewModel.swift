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
        TimeFormatter.formatTime(time)
    }

    var formattedSunrise: String {
        TimeFormatter.formatTime(sunrise)
    }

    var formattedSunset: String {
        TimeFormatter.formatTime(sunset)
    }

    var formattedTemperature: String {
        WeatherFormatter.formatTemperature(temperature)
    }

    var formattedFeelsLike: String {
        WeatherFormatter.formatTemperature(feelsLike)
    }

    var formattedWindSpeed: String {
        WeatherFormatter.formatWindSpeed(windSpeed)
    }

    var formattedDailyMinTemp: String {
        WeatherFormatter.formatTemperature(dailyMinTemp)
    }

    var formattedDailyMaxTemp: String {
        WeatherFormatter.formatTemperature(dailyMaxTemp)
    }

    var formattedHumidity: String {
        WeatherFormatter.formatPercentage(humidity)
    }

    var formattedCloudiness: String {
        WeatherFormatter.formatPercentage(cloudiness)
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
