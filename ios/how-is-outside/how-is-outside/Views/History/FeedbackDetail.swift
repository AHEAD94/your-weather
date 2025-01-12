//
//  FeedbackDetail.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 1/3/25.
//

import SwiftUI

struct FeedbackDetail: View {
    let feedback: Feedback
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text("날짜: \(feedback.date)")
                    Divider()
                    Text("도시: \(feedback.city)")
                    Text("시간: \(feedback.time)")
                }
                
                Group {
                    Divider()
                    Text("온도: \(feedback.temperature)")
                    Text("설명: \(feedback.description)")
                    Divider()
                    Text("최저 온도: \(feedback.min_temp)")
                    Text("최고 온도: \(feedback.max_temp)")
                    Text("체감 온도: \(feedback.feels_like)")
                }
                
                Group {
                    Divider()
                    Text("바람: \(feedback.wind)")
                    Text("구름: \(feedback.clouds)")
                    Text("습도: \(feedback.humidity)")
                    Divider()
                    Text("일출: \(feedback.sunrise)")
                    Text("일몰: \(feedback.sunset)")
                }
                
                Group {
                    Divider()
                    Text("사용자 날씨 체감: \(feedback.user_rating)")
                }
            }
            .padding()
            .navigationTitle("날씨 체감 상세정보")
        }
    }
}

#Preview {
    let feedbacks = LocalFeedbackViewModel().feedbacks
    FeedbackDetail(feedback: feedbacks[0])
}
