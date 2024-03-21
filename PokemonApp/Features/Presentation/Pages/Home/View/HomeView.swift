//
//  HomeView.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//

import SwiftUI
import Observation

struct HomeView: View {
    
    @Bindable var vm: HomePageViewModel
    let pokemon: PokemonResponse
    
    @State var contentHasScrolled = false
    @State var showNav = false
    @State var showDetail: Bool = false
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns) {
                    pokemonListView
                  }
                }
            }
            . navigationTitle("Pokemon")
            .onAppear {
                Task {
                    await vm.loadPokemonList()
                }
            }
        }
        
    
        var pokemonListView: some View {
            ForEach(Array(vm.pokemonList.enumerated()), id: \.offset) { index, pokemon in
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170, height: 140)
                } placeholder: {
                    ProgressView()
                        .frame(width: 140, height: 140)
                        
                }
                .background(.thinMaterial)
                .clipShape(Circle())
                
                Text("\(pokemon.name.capitalized)")
                    .font(.system(size: 16, weight: .regular, design: .monospaced))
                    .padding(.bottom, 20)
        }
    }
}

#Preview {
    NavigationStack {
        HomeView(vm: .init(), pokemon: .init(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
    }
}
