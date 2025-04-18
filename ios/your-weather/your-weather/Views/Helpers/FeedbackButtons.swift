//
//  FeedbackButtons.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/30/24.
//

import SwiftUI

struct FeedbackButtons: View {
    @Binding var selectedRating: String?

    // 체감온도 텍스트 배열
    let ratings: [String] = ["매우추움", "추움", "조금추움", "적절", "조금더움", "더움", "매우더움"]

    // 두 글자마다 줄바꿈을 추가하는 함수
    func splitText(_ text: String) -> String {
        var result = ""
        let characters = Array(text)
        for (index, char) in characters.enumerated() {
            result.append(char)
            
            // 마지막 글자가 아닌 경우에만 줄바꿈 추가
            if (index + 1) % 2 == 0 && index != characters.count - 1 {
                result.append("\n")
            }
        }
        return result
    }
    
    var body: some View {
        VStack {
            Text("오늘 날씨 체감은 어떤가요?")
                .font(.headline)
                .padding()

            HStack() {
                ForEach(ratings, id: \.self) { rating in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) { // 애니메이션 추가
                            selectedRating = rating
                        }
                    }) {
                        Text(splitText(rating))
                            .font(.caption)
                            .frame(width: 45, height: 60)
                            .background(
                                selectedRating == rating ? Color.blue : Color(UIColor.systemGray5)
                            )
                            .foregroundColor(
                                selectedRating == rating ? Color.white : Color(UIColor.label)
                            )
                            .clipShape(Capsule())
                            .overlay(
                                Capsule()
                                    .stroke(selectedRating == rating ? Color.blue : Color(UIColor.systemGray2), lineWidth: 2)
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    FeedbackButtons(selectedRating: .constant(nil))
}
