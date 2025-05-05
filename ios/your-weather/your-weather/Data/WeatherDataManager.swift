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
    private var fileURL: URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName)
    }
    
    private init() {
        createEmptyJSONIfNeeded()
    }
    
    private func createEmptyJSONIfNeeded() {
        let fileManager = FileManager.default
        guard let fileURL = fileURL else { return }
        if !fileManager.fileExists(atPath: fileURL.path) {
            let emptyData = "{}".data(using: .utf8)
            fileManager.createFile(atPath: fileURL.path, contents: emptyData, attributes: nil)
        }
    }
    
    func saveWeatherData(_ data: WeatherResponse) {
        guard let fileURL = fileURL else { return }
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let jsonData = try encoder.encode(data)
            try jsonData.write(to: fileURL)
        } catch {
            print("Failed to save weather data to JSON file: \(error)")
        }
    }
    
    func loadWeatherData() -> WeatherResponse? {
        guard let fileURL = fileURL else { return nil }
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            return try decoder.decode(WeatherResponse.self, from: data)
        } catch {
            print("Failed to load weather data from JSON file: \(error)")
            return nil
        }
    }
}
