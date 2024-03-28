//
//  HomePageViewModel.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//
import SwiftUI
import Foundation
import Observation

@Observable class HomePageViewModel {
    
    private let useCase: PokemonUseCase
    
    var pokemonList: [PokemonBusinessModel] = []
    var pokemonDetails: DetailPokemonBusinessModel?
    
    var viewError: AppError?
    var hasError: Bool = false
    var isLoading: Bool = false
    var searchText = ""
    private var currentPage: Int = 1
    
    
    init(useCase: PokemonUseCase = DefaultPokemonUseCase()) {
        self.useCase = useCase
    }
    
    @MainActor
    func loadPokemonList() async {
        guard !isLoading else { return }
        
        isLoading = true
        
        do {
            let response = try await useCase.getPokemon(pageNumber: "\(currentPage)")
            
            pokemonList += response.results
            hasError = false
            currentPage += 1
            isLoading = false
        } catch {
            isLoading = false
            viewError = .unExpectedError
            hasError = true
        }
    }
    
    func getDetailsPokemon(id: Int)  {
        useCase.getDetailedPokemon(id: id) { data in
            self.pokemonDetails = data
        }
    }
    
    
     func getPokemonIndex(pokemon: PokemonBusinessModel) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }

        
}
