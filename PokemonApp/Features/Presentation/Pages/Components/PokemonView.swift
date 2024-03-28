//
//  PokemonView.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 26/03/24.
//

import SwiftUI

struct PokemonView: View {
    
    let pokemon: PokemonResponse
    
    var body: some View {
        VStack {
        
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
        
        }

    }
}


