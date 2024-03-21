//
//  PokemonListBusinessModel.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//

import Foundation

struct PokemonListBusinessModel {
    let info: InfoBusinessModel
    let results: [PokemonBusinessModel]
    
    init(response: PokemonListResponse) {
        info = InfoBusinessModel(next: response.next ?? "", previous: response.previous ?? "")
        results = response.results.map({ response in
          PokemonBusinessModel(response: response)
        })
    }
}

// MARK: - Info
struct InfoBusinessModel {
    let next, previous: String
    
    init(next: String, previous: String) {
        self.next = next
        self.previous = previous
    }
}

// MARK: - Result
struct PokemonBusinessModel: Codable, Equatable  {
    let name: String
    let url: String
    
    init(response: PokemonResponse) {
        name = response.name
        url = response.url
    }
}
