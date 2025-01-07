//
//  FeedbackDataIcons.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 1/4/25.
//

import SwiftUI

struct FeedbackDataIcons: View {
    var body: some View {
        HStack {
            Spacer(minLength: 7)
            Image(systemName: "calendar.badge.clock")
                .frame(maxWidth: .infinity)
            Spacer()
            Image(systemName: "person.and.background.striped.horizontal")
                .frame(maxWidth: .infinity)
            Spacer()
            Image(systemName: "cloud.sun.fill")
                .frame(maxWidth: .infinity)
            Spacer()
            Image(systemName: "thermometer.medium")
                .frame(maxWidth: .infinity)
            Spacer()
            Image(systemName: "humidity.fill")
                .frame(maxWidth: .infinity)
            Spacer()
            Image(systemName: "wind")
                .frame(maxWidth: .infinity)
            Spacer(minLength: 25)
        }
        .padding(12)
    }
}

#Preview {
    FeedbackDataIcons()
}
