//
//  FooterMessage.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/30/24.
//

import SwiftUI

struct FooterMessage: View {
    var body: some View {
        VStack {
            Text("날씨 체감 Insight")
            Text("밖에 어때, How is Outside")
        }
        .font(.system(.footnote, weight: .regular))
        .foregroundStyle(.secondary)
        .padding(.top, 30)
    }
}

#Preview {
    FooterMessage()
}
