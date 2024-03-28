//
//  PokemonRepository.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//

import Foundation

protocol PokemonRepository {
    func getPokemon(pageNumber: String?) async throws -> PokemonListResponse
    func getDetailedPokemon(id: Int,completion: @escaping (DetailPokemonResponse) -> ())
    func searchPokemon(by name: String) async throws -> DetailPokemonResponse
}




class DefaultPokemonRepository: PokemonRepository {
   
    
    private let apiService: ApiService
    private let cache = DefaultNSCacheStorageDatasource<String, PokemonListResponse>()
    
    init(apiService: ApiService = DefaultApiService()) {
        self.apiService = apiService
    }
    
    
    func getPokemon(pageNumber: String?) async throws -> PokemonListResponse {
        if let cacheResponse = retrieve(by: pageNumber ?? "1") { return cacheResponse }
        
        do {
            let endpoint = RemoteURL.baseUrl + RemoteURL.pokemon + "\(RemoteURL.pagination)\(pageNumber ?? "1")"
            let response: PokemonListResponse = try await apiService.getDataFromGetRequest(from: endpoint)
            self.save(with: pageNumber ?? "1", response: response)
            return response
        } catch {
            throw error
        }
    }
    
    func getDetailedPokemon(id: Int,completion: @escaping (DetailPokemonResponse) -> ())  {
        let endpoint = "https://pokeapi.co/api/v2/pokemon/\(id)/"
         apiService.fetchData(url: endpoint, model: DetailPokemonResponse.self) { data in
            completion(data)
             print(data)
        } failure: { error in
            print("error")
        }
    }
    
    func searchPokemon(by name: String) async throws -> DetailPokemonResponse {
        do {
            let endpoint = RemoteURL.baseUrl + RemoteURL.pokemon + "\(RemoteURL.name)\(name)"
            return try await apiService.getDataFromGetRequest(from: endpoint)
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
