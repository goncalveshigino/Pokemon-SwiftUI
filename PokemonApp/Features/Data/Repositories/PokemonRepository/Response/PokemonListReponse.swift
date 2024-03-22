//
//  PokemonListReponse.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//

import Foundation
struct PokemonListResponse: Codable {
    let count: Int
    let next, previous: String?
    let results: [PokemonResponse]
}

// MARK: - Result
struct PokemonResponse: Codable {
    let name: String
    let url: String
}
