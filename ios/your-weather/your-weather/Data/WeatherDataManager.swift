//
//  WeatherDataManager.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 1/11/25.
//

import Foundation

class WeatherDataManager {
    static let shared = WeatherDataManager()
    private let fileName = "weatherData.json"
    
    private init() {}

    func saveWeatherData(_ data: WeatherResponse) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let jsonData = try? encoder.encode(data) {
            let fileManager = FileManager.default
            if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent(fileName)
                try? jsonData.write(to: fileURL)
            }
        }
    }
    
    func loadWeatherData() -> WeatherResponse? {
        let fileManager = FileManager.default
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            if let data = try? Data(contentsOf: fileURL) {
                let decoder = JSONDecoder()
                return try? decoder.decode(WeatherResponse.self, from: data)
            }
        }
        return nil
    }
}
