//
//  PastWeatherView.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct PastWeatherView: View {
    var body: some View {
        VStack {
            Text("[ 더웠던 날 ]")
                .font(.headline)
                .padding(.bottom, 1)
            Text("2023년 8월 15일")
                .font(.subheadline)
                .multilineTextAlignment(.center)
            Text("맑음, 25°C")
                .font(.subheadline)
                .multilineTextAlignment(.center)
            
            // 착장 정보는 착용한 의복만 보이도록 구현
            Text("착장 정보")
                .font(.headline)
                .padding(.top, 1)
            Text("상의 : 반팔티")
                .font(.subheadline)
            Text("하의 : 청바지")
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .padding()
        .background(Color.orange.opacity(0.7))
        .cornerRadius(12)
    }
}

#Preview {
    PastWeatherView()
}
