//
//  MyClosetView.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct MyClosetView: View {
    var body: some View {
        VStack {
            Text("[ 내 옷장 ]")
                .font(.headline)
                .padding(.bottom, 1)
            Text("추천: 얇은 셔츠, 반바지")
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .padding()
        .background(Color.purple.opacity(0.7))
        .cornerRadius(12)
    }
}

#Preview {
    MyClosetView()
}
