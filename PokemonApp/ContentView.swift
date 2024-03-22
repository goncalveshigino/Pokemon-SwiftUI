//
//  ContentView.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 20/03/24.
//

//https://pokedex-bb36f.firebaseio.com/pokemon.json
import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(vm: HomePageViewModel(), pokemon: .init(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
    }
}

#Preview {
    ContentView()
}
