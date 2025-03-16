//
//  Feedback.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 1/3/25.
//

import Foundation

struct Feedback: Codable, Identifiable, Equatable {
    var id: String
    var date: String
    var city: String
    var time: String
    var temperature: String
    var description: String
    var min_temp: String
    var max_temp: String
    var feels_like: String
    var wind: String
    var clouds: String
    var humidity: String
    var sunrise: String
    var sunset: String
    var user_rating: String
}
