//
//  WeatherService.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import Foundation

class WeatherService {
    private var apiKey: String {
        get {
            // .plist 파일 경로 불러오기
            guard let filePath = Bundle.main.path(forResource: "keys", ofType: "plist") else {
                fatalError("Couldn't find file 'keys.plist'.")
            }
            
            // .plist를 딕셔너리로 받아오기
            let plist = NSDictionary(contentsOfFile: filePath)
            
            // 딕셔너리에서 값 찾기
            guard let value = plist?.object(forKey: "OPENWEATHERMAP_KEY") as? String else {
                fatalError("Couldn't find key 'OPENWEATHERMAP_KEY' in 'keys.plist'.")
            }
            return value
        }
    }
    
    func fetchWeather(city: String, completion: @escaping (WeatherResponse?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(apiKey)&lang=kr"
        
        // 위도, 경도 기반 요청
        // let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=37.5665&lon=126.9780&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            // JSON 응답 출력
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON Response: \(jsonString)")
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(WeatherResponse.self, from: data)
                completion(weatherData)
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
