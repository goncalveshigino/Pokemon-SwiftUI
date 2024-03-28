//
//  PokemonUseCase.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//

import Foundation

protocol PokemonUseCase {
    func getPokemon(pageNumber: String?) async throws -> PokemonListBusinessModel
    func getDetailedPokemon(id: Int, completion: @escaping (DetailPokemonBusinessModel) -> ())
    func searchPokemon(by name: String) async throws -> DetailPokemonBusinessModel
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
    
    
    func getDetailedPokemon(id: Int, completion: @escaping (DetailPokemonBusinessModel) -> ()) {
        repository.getDetailedPokemon(id: id) { response in
            let businessModel = DetailPokemonBusinessModel(response: response)
            completion(businessModel)
        }
    }
    
    func searchPokemon(by name: String) async throws -> DetailPokemonBusinessModel {
        do {
            let response = try await repository.searchPokemon(by: name)
            return DetailPokemonBusinessModel(response: response)
        } catch {
            throw error
        }
    }
    
}
