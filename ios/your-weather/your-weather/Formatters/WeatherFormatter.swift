//
//  WeatherFormatter.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 4/20/25.
//

import Foundation

struct WeatherFormatter {
    private static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        formatter.numberStyle = .decimal
        return formatter
    }()

    static func formatTemperature(_ value: Double) -> String {
        let string = numberFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
        return "\(string)°C"
    }

    static func formatWindSpeed(_ value: Double) -> String {
        let string = numberFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
        return "\(string)m/s"
    }

    static func formatPercentage(_ value: Int) -> String {
        return "\(value)%"
    }
}
