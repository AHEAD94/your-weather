//
//  HistoryList.swift
//  how-is-outside
//
//  Created by Ryu Dae-ha on 12/28/24.
//

import SwiftUI

struct HistoryList: View {
    let feedbacks = ModelData().feedbacks
    
    var body: some View {
        NavigationSplitView {
            VStack {
                Text("체감 정보")
                    .font(.system(.largeTitle, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                
                List {
                    HStack {
                        Spacer(minLength: 7)
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
                    ForEach(feedbacks) { feedback in
                        NavigationLink {
                            FeedbackDetail()
                        } label: {
                            HistoryRow(feedback: feedback)
                        }
                    }
                }
                .listStyle(.plain)
                .animation(.default, value: feedbacks)
            }
        } detail: {
            Text("체감 정보 선택")
        }
    }
}

#Preview {
    HistoryList()
}
