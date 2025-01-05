//
//  HistoryRow.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 1/3/25.
//

import SwiftUI

struct HistoryRow: View {
    var feedback: Feedback
    
    var body: some View {
        HStack {
            Text(feedback.user_rating)
                .frame(maxWidth: .infinity)
                .lineLimit(1)
                .padding(.vertical, 8)
            Spacer()
            Text(feedback.description)
                .frame(maxWidth: .infinity)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.1)
            Spacer()
            Text(feedback.temperature)
                .frame(maxWidth: .infinity)
                .lineLimit(1)
            Spacer()
            Text(feedback.humidity)
                .frame(maxWidth: .infinity)
                .lineLimit(1)
            Spacer()
            Text(feedback.wind)
                .frame(maxWidth: .infinity)
                .lineLimit(1)
        }
    }
}

#Preview {
    let feedbacks = FeedbackModelData().feedbacks
    return Group {
        HistoryRow(feedback: feedbacks[0])
        HistoryRow(feedback: feedbacks[1])
        HistoryRow(feedback: feedbacks[13])
    }
}
