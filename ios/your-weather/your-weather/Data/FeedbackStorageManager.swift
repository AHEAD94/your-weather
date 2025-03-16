//
//  FeedbackStorageManager.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 1/11/25.
//

import Foundation

class FeedbackStorageManager {
    private let fileName = "feedbackData.json"
    
    private func getDocumentDirectory() -> URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    func saveFeedbacks(_ feedbacks: [Feedback]) {
        guard let url = getDocumentDirectory()?.appendingPathComponent(fileName) else {
            print("Error: Could not find document directory.")
            return
        }
        
        do {
            let data = try JSONEncoder().encode(feedbacks)
            try data.write(to: url)
            print("Feedbacks saved successfully.")
        } catch {
            print("Error saving feedbacks: \(error)")
        }
    }
    
    func loadFeedbacks() -> [Feedback] {
        guard let url = getDocumentDirectory()?.appendingPathComponent(fileName) else {
            print("Error: Could not find document directory.")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([Feedback].self, from: data)
        } catch {
            print("Error loading feedbacks: \(error)")
            return []
        }
    }
}
