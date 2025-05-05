//
//  FeedbackStorageManager.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 1/11/25.
//

import Foundation

class FeedbackStorageManager {
    static let shared = FeedbackStorageManager()
    private let fileName = "feedbackData.json"
    private var fileURL: URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(fileName)
    }
    
    private init() {
        createEmptyJSONIfNeeded()
    }

    private func createEmptyJSONIfNeeded() {
        guard let fileURL = fileURL else { return }
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: fileURL.path) {
            let emptyArrayData = "[]".data(using: .utf8)
            fileManager.createFile(atPath: fileURL.path, contents: emptyArrayData, attributes: nil)
        }
    }
    
    func saveFeedbacks(_ feedbacks: [Feedback]) {
        guard let fileURL = fileURL else { return }
        do {
            let data = try JSONEncoder().encode(feedbacks)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save feedbacks into JSON file: \(error)")
        }
    }
    
    func loadFeedbacks() -> [Feedback] {
        guard let fileURL = fileURL else { return [] }
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode([Feedback].self, from: data)
        } catch {
            print("Failed to load feedbacks from JSON file: \(error)")
            return []
        }
    }
}
