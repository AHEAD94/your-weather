//
//  FooterMessage.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/30/24.
//

import SwiftUI

struct FooterMessage: View {
    var body: some View {
        VStack {
            Text("개인형 날씨 체감 Insight")
            Text("Your Weather")
        }
        .font(.system(.footnote, weight: .regular))
        .foregroundStyle(.secondary)
        .padding(.top, 30)
    }
}

#Preview {
    FooterMessage()
}
