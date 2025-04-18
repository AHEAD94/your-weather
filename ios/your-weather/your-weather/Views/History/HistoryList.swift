//
//  HistoryList.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct HistoryList: View {
    @EnvironmentObject var localFeedbackViewModel: LocalFeedbackViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("체감 정보")
                        .font(.system(.largeTitle, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    
                    Spacer()
                    
                    ServerButton()
                }
                
                FeedbackDataIcons()
                
                List {
                    ForEach(localFeedbackViewModel.feedbacks) { feedback in
                        NavigationLink {
                            FeedbackDetail(feedback: feedback)
                        } label: {
                            HistoryRow(feedback: feedback)
                        }
                    }
                    .onDelete(perform: deleteFeedback)
                }
                .listStyle(.plain)
                .animation(.default, value: localFeedbackViewModel.feedbacks)
            }
        }
    }
    
    private func deleteFeedback(at offsets: IndexSet) {
        localFeedbackViewModel.feedbacks.remove(atOffsets: offsets)
        localFeedbackViewModel.saveFeedbacks() // 로컬 데이터 업데이트
    }
}

#Preview {
    HistoryList()
        .environmentObject(LocalFeedbackViewModel())
}
