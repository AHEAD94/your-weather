//
//  WeatherViewModel.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
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
    
    // 초기화 시 저장된 JSON 파일에서 데이터 로드
    init() {
        loadWeatherData()
    }

    // open API에서 날씨 데이터 가져오기
    func fetchWeather(city: String) {
        how_is_outside.fetchWeather(city: city) { response in
            DispatchQueue.main.async {
                if let data = response {
                    self.currentTemp = "\(data.main.temp)°C"
                    self.feelsLikeTemp = "\(data.main.feels_like)°C"
                    self.humidity = "\(data.main.humidity)%"
                    self.windSpeed = "\(data.wind.speed)m/s"
                    self.cloudiness = "\(data.clouds.all)%"
                    self.dailyMinTemp = "\(data.main.temp_min)°C"
                    self.dailyMaxTemp = "\(data.main.temp_max)°C"
                    self.weatherDescription = data.weather.first?.description ?? "No description"
                    self.cityName = data.name
                    self.sunrise = self.formatUnixTime(data.sys.sunrise)
                    self.sunset = self.formatUnixTime(data.sys.sunset)
                    
                    self.saveWeatherDataToJSON(data: data)  // 날씨 데이터를 JSON으로 저장
                } else {
                    self.clearWeatherData()
                }
            }
        }
    }
    
    // 날씨 데이터 초기화
    private func clearWeatherData() {
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
    
    // 날씨 데이터를 JSON 파일로 저장
    private func saveWeatherDataToJSON(data: WeatherResponse) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let jsonData = try? encoder.encode(data) {
            let fileManager = FileManager.default
            if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent("weatherData.json")
                try? jsonData.write(to: fileURL)
            }
        }
    }
    
    // 저장된 날씨 데이터 JSON 파일에서 읽기
    private func loadWeatherData() {
        let fileManager = FileManager.default
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent("weatherData.json")
            if let data = try? Data(contentsOf: fileURL) {
                let decoder = JSONDecoder()
                if let weatherData = try? decoder.decode(WeatherResponse.self, from: data) {
                    self.currentTemp = "\(weatherData.main.temp)°C"
                    self.feelsLikeTemp = "\(weatherData.main.feels_like)°C"
                    self.humidity = "\(weatherData.main.humidity)%"
                    self.windSpeed = "\(weatherData.wind.speed)m/s"
                    self.cloudiness = "\(weatherData.clouds.all)%"
                    self.dailyMinTemp = "\(weatherData.main.temp_min)°C"
                    self.dailyMaxTemp = "\(weatherData.main.temp_max)°C"
                    self.weatherDescription = weatherData.weather.first?.description ?? "No description"
                    self.cityName = weatherData.name
                    self.sunrise = formatUnixTime(weatherData.sys.sunrise)
                    self.sunset = formatUnixTime(weatherData.sys.sunset)
                }
            }
        }
    }
}
