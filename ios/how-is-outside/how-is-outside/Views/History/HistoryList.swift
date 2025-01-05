//
//  HistoryList.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct HistoryList: View {
    @StateObject private var modelData = FeedbackModelData.shared
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("체감 정보")
                        .font(.system(.largeTitle, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    
                    Spacer()
                    
                    ServerButton()
                }
                
                FeedbackDataIcons()
                
                List {
                    ForEach(modelData.feedbacks) { feedback in
                        NavigationLink {
                            FeedbackDetail()
                        } label: {
                            HistoryRow(feedback: feedback)
                        }
                    }
                }
                .listStyle(.plain)
                .animation(.default, value: modelData.feedbacks)
            }
        }
    }
}

#Preview {
    HistoryList()
}
