//
//  TimeFormatter.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 4/20/25.
//

import Foundation

struct TimeFormatter {
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()

    static func formatTime(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}
