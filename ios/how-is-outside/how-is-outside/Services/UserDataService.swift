//
//  UserDataService.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/31/24.
//

import Foundation

func addWeatherFeedback(weatherData: [String: Any]) {
    guard let url = URL(string: "http://127.0.0.1:5000/weather") else {
        print("Invalid URL")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: weatherData, options: [])
        request.httpBody = jsonData
    } catch {
        print("Failed to encode JSON: \(error.localizedDescription)")
        return
    }
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Request error: \(error.localizedDescription)")
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
            print("Failed to add weather data")
            return
        }
        
        print("Weather data added successfully")
    }.resume()
}
