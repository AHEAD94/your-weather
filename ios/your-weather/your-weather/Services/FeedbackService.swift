//
//  FeedbackService.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/31/24.
//

import Foundation

class FeedbackService {
    func postWeatherFeedback(feedbackData: [String: Any]) {
        guard let url = URL(string: "http://127.0.0.1:5000/weather") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: feedbackData, options: [])
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
    
    func fetchWeatherFeedback(completion: @escaping ([Feedback]) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:5000/weather") else {
            print("Invalid URL")
            completion([])
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Failed to fetch weather data")
                completion([])
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion([])
                return
            }
            
            do {
                // JSON 데이터를 Feedback 배열로 디코딩
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // 날짜 디코딩을 ISO 8601 형식으로 설정
                let feedbackArray = try decoder.decode([Feedback].self, from: data)
                completion(feedbackArray)
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
                completion([])
            }
        }.resume()
    }
    
    func deleteWeatherFeedback(feedbackID: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:5000/weather/\(feedbackID)") else {
            print("Invalid URL")
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Failed to delete feedback on server.")
                completion(false)
                return
            }
            
            print("Feedback deleted successfully from server.")
            completion(true)
        }.resume()
    }
}
