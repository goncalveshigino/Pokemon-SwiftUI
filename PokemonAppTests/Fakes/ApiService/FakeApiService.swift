//
//  FakeApiService.swift
//  PokemonAppTests
//
//  Created by Goncalves Higino on 21/03/24.
//

import Foundation
@testable import PokemonApp

class PokemonFakeApiServiceSuccess: ApiService {
    
    func getDataFromGetRequest<Response : Codable>(from url: String) async throws -> Response  {
        do {
           let url = PokemonFakeList.makePokemonFakeListJson()
            let decodedData = try JSONDecoder().decode(Response.self, from: url)
            return decodedData
        } catch {
            if (error as? DecodingError) != nil {
                throw AppError.parseError
            }
            throw AppError.serviceError(error: error)
        }
    }
    
    
}

class DetailsPokemonFakeApiServiceSuccess: ApiService {
    func getDataFromGetRequest<Response : Codable>(from url: String) async throws -> Response  {
        do {
           let url = PokemonFakeList.detailPokemonFake()
            let decodedData = try JSONDecoder().decode(Response.self, from: url)
            return decodedData
        } catch {
            if (error as? DecodingError) != nil {
                throw AppError.parseError
            }
            throw AppError.serviceError(error: error)
        }
    }
}

class CharacterListFakeApiServiceFailure: ApiService {
    func getDataFromGetRequest<Response: Codable>(from url: String) async throws -> Response  {
        throw AppError.missingData
    }
}

class PokemonFakeApiServiceFailure: ApiService {
    func getDataFromGetRequest<Response : Codable>(from url: String) async throws -> Response {
        do {
            let url = PokemonFakeList.makePokemListJsonFakeParserError()
            let decodedData = try JSONDecoder().decode(Response.self, from: url)
            return decodedData
        } catch {
            if (error as? DecodingError) != nil {
                throw AppError.parseError
            }
            throw AppError.serviceError(error: error)
        }
    }
}
