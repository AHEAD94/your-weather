//
//  Feedback.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 1/3/25.
//

import Foundation

struct Feedback: Codable, Identifiable, Equatable {
    var id: Int
    var date: String
    var city: String
    var time: String
    var temperature: Double
    var description: String
    var min_temp: Double
    var max_temp: Double
    var feels_like: Double
    var wind: Double
    var clouds: Int
    var humidity: Int
    var sunrise: String
    var sunset: String
    var user_rating: String
}
