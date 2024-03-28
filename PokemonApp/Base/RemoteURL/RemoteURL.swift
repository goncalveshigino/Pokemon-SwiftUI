//
//  RemoteURL.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//
//https://pokeapi.co/api/v2/pokemon/{id or name}/
//pokemon?limit=100000&offset=0

//https://pokeapi.co/api/v2/pokemon/3/ details

import Foundation

enum RemoteURL {
    static let baseUrl: String = "https://pokeapi.co/api/v2/"
    static let imageUrl: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    static let pokemon: String = "pokemon"
    static let pagination = "?offset="
    static let searchPagination = "&limit="
    static let name = "/name"
    static let details = "https://pokeapi.co/api/v2/pokemon/"
    
}


