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
    @Published var nextId: Int = 1
    
    private let storageManager = FeedbackStorageManager()
    
    init() {
        loadFeedbacks()
        
        // 뷰모델 로드 시에, 저장된 피드백들 중 가장 큰 id값을 nextId로 설정
        if let maxId = feedbacks.max(by: { $0.id < $1.id })?.id {
            nextId = maxId + 1
        }
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
