//
//  PokemonUseCase.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//

import Foundation

protocol PokemonUseCase {
    func getPokemon(paginaNumber: String?) async throws -> PokemonListBusinessModel
    func getDetailedPokemon(id: Int) async throws -> DetailPokemonListBusinessModel
}


class DefaultPokemonUseCase: PokemonUseCase {
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository = DefaultPokemonRepository()) {
        self.repository = repository
    }
    
    func getPokemon(paginaNumber: String?) async throws -> PokemonListBusinessModel {
        do {
            let response = try await repository.getPokemon(paginaNumber: paginaNumber)
            return PokemonListBusinessModel(response: response)
        } catch {
            throw error
        }
    }
    
    func getDetailedPokemon(id: Int) async throws -> DetailPokemonListBusinessModel {
        do {
            let response = try await repository.getDetailedPokemon(id: id)
            return DetailPokemonListBusinessModel(response: response)
        } catch {
            throw error
        }
    }
}
