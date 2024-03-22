//
//  PokemonUseCase.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//

import Foundation

protocol PokemonUseCase {
    func getPokemon(pageNumber: String?) async throws -> PokemonListBusinessModel
    func getDetailedPokemon(id: Int) async throws -> DetailPokemonListBusinessModel
    func searchCharacter(by name: String, and pageNumber: String?) async throws -> PokemonListBusinessModel
}


class DefaultPokemonUseCase: PokemonUseCase {
   
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository = DefaultPokemonRepository()) {
        self.repository = repository
    }
    
    func getPokemon(pageNumber: String?) async throws -> PokemonListBusinessModel {
        do {
            let response = try await repository.getPokemon(pageNumber: pageNumber)
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
    
    func searchCharacter(by name: String, and pageNumber: String?) async throws -> PokemonListBusinessModel {
        do {
            let response = try await repository.searchCharacter(by: name, and: pageNumber)
            return PokemonListBusinessModel(response: response)
        } catch {
            throw error
        }
    }
    
}
