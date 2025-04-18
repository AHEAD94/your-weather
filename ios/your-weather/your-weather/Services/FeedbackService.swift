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
                // JSON 데이터를 [String: Any] 형태로 디코딩
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    var feedbackArray: [Feedback] = []
                    
                    for jsonItem in jsonArray {
                        if let idInt = jsonItem["id"] as? Int { // id를 Int로 읽음
                            let id = String(idInt) // id를 String으로 변환
                            
                            let feedback = Feedback(
                                id: id,
                                date: jsonItem["date"] as? String ?? "",
                                city: jsonItem["city"] as? String ?? "",
                                time: jsonItem["time"] as? String ?? "",
                                temperature: jsonItem["temperature"] as? String ?? "",
                                description: jsonItem["description"] as? String ?? "",
                                min_temp: jsonItem["min_temp"] as? String ?? "",
                                max_temp: jsonItem["max_temp"] as? String ?? "",
                                feels_like: jsonItem["feels_like"] as? String ?? "",
                                wind: jsonItem["wind"] as? String ?? "",
                                clouds: jsonItem["clouds"] as? String ?? "",
                                humidity: jsonItem["humidity"] as? String ?? "",
                                sunrise: jsonItem["sunrise"] as? String ?? "",
                                sunset: jsonItem["sunset"] as? String ?? "",
                                user_rating: jsonItem["user_rating"] as? String ?? ""
                            )
                            feedbackArray.append(feedback)
                        }
                    }
                    completion(feedbackArray)
                } else {
                    print("Invalid JSON format")
                    completion([])
                }
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
