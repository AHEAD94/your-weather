//
//  LocalFeedbackViewModel.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 1/3/25.
//

import Foundation
import Combine

class LocalFeedbackViewModel: ObservableObject {
    @Published var feedbacks: [Feedback] = []
    
    private let storageManager = FeedbackStorageManager.shared
    
    init() {
        loadFeedbacks()
    }
    
    func addFeedback(feedback: Feedback) {
        feedbacks.append(feedback)
        saveFeedbacks()
    }
    
    func saveFeedbacks() {
        storageManager.saveFeedbacks(feedbacks)
    }
    
    func loadFeedbacks() {
        feedbacks = storageManager.loadFeedbacks()
    }
}
