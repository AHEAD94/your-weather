//
//  ServerHistoryList.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 1/4/25.
//

import SwiftUI

struct ServerHistoryList: View {
    @State private var feedbackList: [Feedback] = [] // 서버 데이터를 저장할 배열
    @State private var isLoading = true             // 로딩 상태 표시
    
    var body: some View {
        VStack {
            HStack {
                Text("서버 등록 내역")
                    .font(.system(.title3, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 12)
                    .padding(.bottom, 8)
            }
            
            FeedbackDataIcons()
            
            if isLoading {
                ProgressView("Loading...") // 로딩 상태 표시
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .padding(.bottom, 30)
            } else if feedbackList.isEmpty {
                Text("불러온 데이터가 없습니다.")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .padding(.bottom, 30)
            } else {
                List {
                    ForEach(feedbackList) { feedback in
                        NavigationLink {
                            FeedbackDetail(feedback: feedback)
                        } label: {
                            HistoryRow(feedback: feedback)
                        }
                    }
                    .onDelete(perform: deleteFeedback)
                }
                .listStyle(.plain)
                .animation(.default, value: feedbackList)
            }
        }
        .onAppear {
            loadFeedbackData() // 뷰가 나타날 때 데이터 로드
        }
    }
    
    // 서버에서 데이터를 가져와 배열에 저장
    private func loadFeedbackData() {
        fetchWeatherFeedback { feedbackArray in
            DispatchQueue.main.async {
                self.feedbackList = feedbackArray
                self.isLoading = false
            }
        }
    }
    
    private func deleteFeedback(at offsets: IndexSet) {
        let feedbacksToDelete = offsets.map { feedbackList[$0] }
        
        for feedback in feedbacksToDelete {
            deleteWeatherFeedback(feedbackID: feedback.id) { success in
                if success {
                    DispatchQueue.main.async {
                        feedbackList.removeAll { $0.id == feedback.id }
                    }
                } else {
                    print("Failed to delete feedback from server.")
                }
            }
        }
    }
}

#Preview {
    ServerHistoryList()
}
