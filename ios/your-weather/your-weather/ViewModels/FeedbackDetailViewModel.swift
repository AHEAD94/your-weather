//
//  FeedbackDetailViewModel.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 4/24/25.
//

import Foundation

class FeedbackDetailViewModel: ObservableObject {
    let feedback: Feedback

    init(feedback: Feedback) {
        self.feedback = feedback
    }

    var date: String {
        feedback.date
    }

    var city: String {
        feedback.city
    }

    var time: String {
        feedback.time
    }

    var temperature: String {
        WeatherFormatter.formatTemperature(feedback.temperature)
    }

    var description: String {
        feedback.description
    }

    var minTemp: String {
        WeatherFormatter.formatTemperature(feedback.min_temp)
    }

    var maxTemp: String {
        WeatherFormatter.formatTemperature(feedback.max_temp)
    }

    var feelsLike: String {
        WeatherFormatter.formatTemperature(feedback.feels_like)
    }

    var wind: String {
        WeatherFormatter.formatWindSpeed(feedback.wind)
    }

    var clouds: String {
        WeatherFormatter.formatPercentage(feedback.clouds)
    }

    var humidity: String {
        WeatherFormatter.formatPercentage(feedback.humidity)
    }

    var sunrise: String {
        feedback.sunrise
    }

    var sunset: String {
        feedback.sunset
    }

    var userRating: String {
        feedback.user_rating
    }
}
