//
//  PokemonDetailPage.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 26/03/24.
//

import SwiftUI

struct PokemonDetailPage: View {
    @Environment(\.dismiss) var dismiss
    
    @Bindable var vm: HomePageViewModel
    let pokemon: PokemonBusinessModel?
    
    var body: some View {
        VStack {
          
            if let pokemon = pokemon {
                
                if let url = URL(string: RemoteURL.imageUrl + "\(vm.getPokemonIndex(pokemon: pokemon)).png") {
                    AsyncImageView(url: url)
                        .frame(width: 150, height: 150)
                }
                
                Text(vm.pokemonDetails?.name ?? "")
                    .font(.system(size: 16, weight: .regular, design: .monospaced))
                    .foregroundStyle(Color.white)
                    .padding(.bottom, 20)
            }
        }
        .background(Color("ColorBlueDark"))
        .ignoresSafeArea()
        .onAppear {
            vm.getDetailsPokemon(id: 1)
        }
    }
    
  
}


