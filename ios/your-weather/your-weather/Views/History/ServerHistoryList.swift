//
//  ServerHistoryList.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 1/4/25.
//

import SwiftUI

struct ServerHistoryList: View {
    @StateObject private var serverFeedbackViewModel = ServerFeedbackViewModel()
    
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
            
            if serverFeedbackViewModel.isLoading {
                ProgressView("Loading...") // 로딩 상태 표시
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .padding(.bottom, 30)
            } else if serverFeedbackViewModel.feedbacks.isEmpty {
                Text("불러온 데이터가 없습니다.")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .padding(.bottom, 30)
            } else {
                List {
                    ForEach(serverFeedbackViewModel.feedbacks) { feedback in
                        NavigationLink {
                            FeedbackDetail(feedback: feedback)
                        } label: {
                            HistoryRow(feedback: feedback)
                        }
                    }
                    .onDelete(perform: serverFeedbackViewModel.deleteFeedback)
                }
                .listStyle(.plain)
                .animation(.default, value: serverFeedbackViewModel.feedbacks)
            }
        }
        .onAppear {
            serverFeedbackViewModel.fetchFeedback() // 뷰가 나타날 때 데이터 로드
        }
    }
}

#Preview {
    ServerHistoryList()
}
