//
//  FeedbackModelData.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 1/3/25.
//

import Foundation

class FeedbackModelData: ObservableObject {
    static let shared = FeedbackModelData()
    private let fileName = "feedbackData.json"
    
    @Published var feedbacks: [Feedback] = []

    init() {
        loadFeedbacks()
    }
    
    private func getDocumentDirectory() -> URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    func saveFeedbacks() {
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
    
    func loadFeedbacks() {
        guard let url = getDocumentDirectory()?.appendingPathComponent(fileName) else {
            print("Error: Could not find document directory.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            feedbacks = try JSONDecoder().decode([Feedback].self, from: data)
            print("Feedbacks loaded successfully.")
        } catch {
            print("Error loading feedbacks: \(error)")
        }
    }
}
