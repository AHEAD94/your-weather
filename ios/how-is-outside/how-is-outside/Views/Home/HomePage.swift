//
//  HomePage.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("밖에 어때")
                        .font(.system(.largeTitle, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    Text("날씨 체감 Insight")
                        .font(.system(.body, weight: .medium))
                        .foregroundStyle(.secondary)
                }
                
                // 현재 날씨
                WeatherView()
                
                // 상태바
                StatusBarView()
                
                // 비슷한 과거 의복 & 내 옷장
                HStack {
                    PastWeatherView()
                    MyClosetView()
                }
                
                // 앱 정보
                VStack {
                    Text("날씨 체감 Insight")
                    Text("밖에 어때, How is Outside")
                }
                .font(.system(.caption, weight: .regular))
                .foregroundStyle(.secondary)
                .padding(.top, 30)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

#Preview {
    HomePage()
}
