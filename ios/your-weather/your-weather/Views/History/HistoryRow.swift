//
//  HistoryRow.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 1/3/25.
//

import SwiftUI

struct HistoryRow: View {
    @ObservedObject var feedbackDetailViewModel: FeedbackDetailViewModel

    var body: some View {
        HStack {
            VStack {
                Text(feedbackDetailViewModel.date)
                Text(feedbackDetailViewModel.time)
            }
            .frame(maxWidth: .infinity)
            .lineLimit(1)
            .minimumScaleFactor(0.1)

            Spacer()

            Text(feedbackDetailViewModel.userRating)
                .frame(maxWidth: .infinity)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .padding(.vertical, 8)

            Spacer()

            Text(feedbackDetailViewModel.description)
                .frame(maxWidth: .infinity)
                .lineLimit(1)
                .minimumScaleFactor(0.1)

            Spacer()

            Text(feedbackDetailViewModel.temperature)
                .frame(maxWidth: .infinity)
                .lineLimit(1)
                .minimumScaleFactor(0.1)

            Spacer()

            Text(feedbackDetailViewModel.humidity)
                .frame(maxWidth: .infinity)
                .lineLimit(1)
                .minimumScaleFactor(0.1)

            Spacer()

            Text(feedbackDetailViewModel.wind)
                .frame(maxWidth: .infinity)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
    }
}

#Preview {
    let feedback = LocalFeedbackViewModel().feedbacks[0]
    let feedbackDetailViewModel = FeedbackDetailViewModel(feedback: feedback)
    return HistoryRow(feedbackDetailViewModel: feedbackDetailViewModel)
}
