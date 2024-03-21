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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
