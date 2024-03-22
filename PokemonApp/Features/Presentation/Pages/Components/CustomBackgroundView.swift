//
//  CustomBackgroundView.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            Color.customBlueDark
                .clipShape(.rect(cornerRadius: 20))
                .offset(y: 12)
            
            Color.customBlueLight
                .clipShape(.rect(cornerRadius: 20))
                .offset(x: 3, y: 3)
                .opacity(0.85)
            
            LinearGradient(
                colors: [
                    Color.customBlueLight,
                    Color.customBlueDark.opacity(0.3)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .clipShape(.rect(cornerRadius: 20))
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
