//
//  PokemonRepository.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//

import Foundation

protocol PokemonRepository {
    func getPokemon(paginaNumber: String?) async throws -> PokemonListResponse
    func getDetailedPokemon(id: Int) async throws -> DetailPokemonResponse
}




class DefaultPokemonRepository: PokemonRepository {
    
    private let apiService: ApiService
    private let cache = DefaultNSCacheStorageDatasource<String, PokemonListResponse>()
    
    init(apiService: ApiService = DefaultApiService()) {
        self.apiService = apiService
    }
    
    
    func getPokemon(paginaNumber: String?) async throws -> PokemonListResponse {
        if let cacheResponse = retrieve(by: paginaNumber ?? "1") { return cacheResponse }
        
        do {
            let endpoint = RemoteURL.baseUrl + RemoteURL.pokemon + "\(RemoteURL.pagination)\(paginaNumber ?? "1")"
            let response: PokemonListResponse = try await apiService.getDataFromGetRequest(from: endpoint)
            self.save(with: paginaNumber ?? "1", response: response)
            return response
        } catch {
            throw error
        }
    }
    
    func getDetailedPokemon(id: Int) async throws -> DetailPokemonResponse {
        do {
            let endpoint = "https://pokeapi.co/api/v2/pokemon/\(id)/"
            let response: DetailPokemonResponse = try await apiService.getDataFromGetRequest(from: endpoint)
            return response
        } catch {
            throw error
        }
    }
}


extension DefaultPokemonRepository {
    private func retrieve(by pageNumber: String) -> PokemonListResponse? {
        cache[pageNumber]
    }
    
    private func save(with pageNumber: String, response: PokemonListResponse) {
        cache[pageNumber] = response
    }
}
