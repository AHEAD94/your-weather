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
                } else {
                    self.clearWeatherData()
                }
            }
        }
    }
    
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

    private func formatUnixTime(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.timeZone = .current
        return formatter.string(from: date)
    }
}
