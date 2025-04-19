//
//  HeaderMessage.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 4/19/25.
//

import SwiftUI

struct HeaderMessage: View {
    var body: some View {
        HStack {
            Text("Your Weather")
                .font(.system(.title, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)
            Text("개인형 날씨 체감 Insight")
                .font(.system(.subheadline, weight: .medium))
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    HeaderMessage()
}
