//
//  FeedbackDetail.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 1/3/25.
//

import SwiftUI

struct FeedbackDetail: View {
    @ObservedObject var feedbackDetailViewModel: FeedbackDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text("날짜: \(feedbackDetailViewModel.date)")
                    Divider()
                    Text("도시: \(feedbackDetailViewModel.city)")
                    Text("시간: \(feedbackDetailViewModel.time)")
                }

                Group {
                    Divider()
                    Text("온도: \(feedbackDetailViewModel.temperature)")
                    Text("설명: \(feedbackDetailViewModel.description)")
                    Divider()
                    Text("최저 온도: \(feedbackDetailViewModel.minTemp)")
                    Text("최고 온도: \(feedbackDetailViewModel.maxTemp)")
                    Text("체감 온도: \(feedbackDetailViewModel.feelsLike)")
                }

                Group {
                    Divider()
                    Text("바람: \(feedbackDetailViewModel.wind)")
                    Text("구름: \(feedbackDetailViewModel.clouds)")
                    Text("습도: \(feedbackDetailViewModel.humidity)")
                    Divider()
                    Text("일출: \(feedbackDetailViewModel.sunrise)")
                    Text("일몰: \(feedbackDetailViewModel.sunset)")
                }

                Group {
                    Divider()
                    Text("사용자 날씨 체감: \(feedbackDetailViewModel.userRating)")
                }
            }
            .padding()
            .navigationTitle("날씨 체감 상세정보")
        }
    }
}

#Preview {
    let feedback = LocalFeedbackViewModel().feedbacks[0]
    let feedbackDetailViewModel = FeedbackDetailViewModel(feedback: feedback)
    return FeedbackDetail(feedbackDetailViewModel: feedbackDetailViewModel)
}
