//
//  RemoteURL.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//
//https://pokeapi.co/api/v2/pokemon/{id or name}/
//pokemon?limit=100000&offset=0

import Foundation

enum RemoteURL {
    static let baseUrl: String = "https://pokeapi.co/api/v2/"
    static let pokemon: String = "pokemon"
    static let pagination = "?limit"
    static let searchPagination = "&page"
    static let name = "/?name"
}
