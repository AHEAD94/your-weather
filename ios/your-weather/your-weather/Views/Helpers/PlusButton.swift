//
//  PlusButton.swift
//  your-weather
//
//  Created by Ryu Dae-ha on 12/30/24.
//

import SwiftUI

struct PlusButton: View {
    var body: some View {
        NavigationLink(destination: WeatherSaveView()) {
            Image(systemName: "plus.square.fill")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
                .padding()
        }
    }
}

#Preview {
    PlusButton()
}
