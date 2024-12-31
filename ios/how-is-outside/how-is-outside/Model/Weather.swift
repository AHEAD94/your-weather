//
//  Weather.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/28/24.
//

struct WeatherResponse: Codable {
    let coord: Coordinates
    let weather: [WeatherDetails]
    let main: MainWeather
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let name: String
}

struct Coordinates: Codable {
    let lon: Double
    let lat: Double
}

struct WeatherDetails: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct MainWeather: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

struct Clouds: Codable {
    let all: Int
}

struct Sys: Codable {
    let country: String
    let sunrise: Int
    let sunset: Int
}
