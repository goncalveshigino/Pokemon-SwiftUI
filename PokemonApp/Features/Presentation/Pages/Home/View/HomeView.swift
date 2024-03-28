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
    @State var selectedPokemon: PokemonBusinessModel?

    
    @State var contentHasScrolled = false
    @State var showNav = false
    @State var showDetail: Bool = false


    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150, maximum: 170))
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("ColorBlueDark").ignoresSafeArea()
                scrollView
            }
            .onAppear {
                Task {
                    await vm.loadPokemonList()
                }
            }
            .navigationTitle("POKEMON")
            .preferredColorScheme(.dark)
            .searchable(text: $vm.searchText)
        }
        
    }
    
    var scrollView: some View {
        ScrollView() {
            scrollDetectionView
            pokemonListView
        }.coordinateSpace(.named("scroll"))
    }
    
    var scrollDetectionView: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { value in
            withAnimation(.easeInOut) {
                let estimatedContentHeight = CGFloat(vm.pokemonList.count * 100)
                let threshold = 0.8 * estimatedContentHeight
                if value <= -threshold {
                    Task {
                        await vm.loadPokemonList()
                    }
                }
                contentHasScrolled = value < 0 // ? true : false
            }
        }
    }
    
    
        var pokemonListView: some View {
            LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                ForEach(Array(vm.pokemonList.enumerated()), id: \.offset) { index, pokemon in
                    NavigationLink {
                        PokemonDetailPage(vm: vm, pokemon: pokemon)
                    } label: {
                        ZStack {
                            CustomBackgroundView()
                            
                            VStack {
                                if let url = URL(string: RemoteURL.imageUrl + "\(index + 1).png") {
                                    AsyncImageView(url: url)
                                        .frame(width: 150, height: 150)
                                    }
                                
                                Text("\(pokemon.name.capitalized)")
                                    .font(.system(size: 16, weight: .regular, design:
                                            .monospaced))
                                    .foregroundStyle(Color.white)
                                    .padding(.bottom, 20)
                                
                            }
                           
                            if index == vm.pokemonList.count - 1 {
                                if vm.isLoading {
                                    ProgressView("Loading more characters...")
                                        .accentColor(.white)
                                }
                            }
                            
                        }
                    }

                }
            }
    }
    
}

#Preview {
    NavigationStack {
        HomeView(vm: .init(), pokemon: .init(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
    }
}
