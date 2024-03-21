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
    
    var viewError: AppError?
    var hasError: Bool = false
    var isLoading: Bool = false
    private var currentPage: Int = 1
    
    init(useCase: PokemonUseCase = DefaultPokemonUseCase()) {
        self.useCase = useCase
    }
    
    @MainActor
    func loadPokemonList() async {
        guard !isLoading else { return }
        
        isLoading = true
        
        do {
            let response = try await useCase.getPokemon(paginaNumber: "\(currentPage)")
            
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
    
    func getDetailsPokemon(pokemon: PokemonBusinessModel) async {
        let id = getPokemonIndex(pokemon: pokemon)
        
        do {
           let response = try await useCase.getDetailedPokemon(id: id)
            print(response.sprites)
        } catch {
            
        }
    }
    
     func getPokemonIndex(pokemon: PokemonBusinessModel) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
}

