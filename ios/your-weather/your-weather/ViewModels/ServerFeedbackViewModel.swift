//
//  ServerFeedbackViewModel.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 1/11/25.
//

import Foundation

class ServerFeedbackViewModel: ObservableObject {
    @Published var feedbacks: [Feedback] = []
    @Published var isLoading = false
    @Published var nextId: Int = 1
    
    private let feedbackService = FeedbackService()
    
    init() {
        fetchFeedback()
        
        // 뷰모델 로드 시에, 저장된 피드백들 중 가장 큰 id값을 nextId로 설정
        if let maxId = feedbacks.max(by: { $0.id < $1.id })?.id {
            nextId = maxId + 1
        }
    }

    func fetchFeedback() {
        isLoading = true
        feedbackService.fetchWeatherFeedback { [weak self] feedbackArray in
            DispatchQueue.main.async {
                self?.feedbacks = feedbackArray
                self?.isLoading = false
            }
        }
    }
    
    func postFeedback(feedbackData: [String: Any]) {
        feedbackService.postWeatherFeedback(feedbackData: feedbackData)
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.fetchFeedback()
        }
    }

    func deleteFeedback(at offsets: IndexSet) {
        let feedbacksToDelete = offsets.map { feedbacks[$0] }
        
        for feedback in feedbacksToDelete {
            feedbackService.deleteWeatherFeedback(feedbackID: feedback.id) { [weak self] result in
                DispatchQueue.main.async {
                    self?.feedbacks.removeAll { $0.id == feedback.id }
                }
            }
        }
    }
}
