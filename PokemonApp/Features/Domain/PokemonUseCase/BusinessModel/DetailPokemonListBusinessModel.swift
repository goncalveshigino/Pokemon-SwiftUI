//
//  DetailPokemonBusinessModel.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//


import Foundation

// MARK: - DetailPokemonResponse
struct DetailPokemonBusinessModel: Codable {
    let abilities: [AbilityBusinessModel]
    let height: Int
    let id: Int
    let moves: [MoveBusinessModel]
    let name: String
    let species: SpeciesBusinessModel
    let sprites: SpritesBusinessModel
    let stats: [StatBusinessModel]
    let weight: Int

    init(response: DetailPokemonResponse) {
        abilities = response.abilities.map({ response in
          return AbilityBusinessModel(response: response)
        })
        height = response.height
        id = response.id
        moves = response.moves.map({ response in
         return MoveBusinessModel(response: response)
        })
        name = response.name
        species = SpeciesBusinessModel(response: response.species)
        sprites = SpritesBusinessModel(response: response.sprites)
        stats   = response.stats.map({ response in
         return StatBusinessModel(response: response)
        })
        weight =  response.weight
    }
}

// MARK: - Ability
struct AbilityBusinessModel: Codable {
    let ability: SpeciesBusinessModel
    let isHidden: Bool
    let slot: Int

    init(response: AbilityResponse) {
        let speciesBusinessModel = SpeciesBusinessModel(response: response.ability)
        ability = speciesBusinessModel
        isHidden = response.isHidden
        slot = response.slot
    }
}

// MARK: - Species
struct SpeciesBusinessModel: Codable {
    let name: String
    let url: String
    
    init(response: SpeciesResponse) {
        name = response.name
        url = response.url
    }
}


// MARK: - Move
struct MoveBusinessModel: Codable {
    let move: SpeciesBusinessModel

    init(response: MoveResponse) {
        let speciesBusinessModel = SpeciesBusinessModel(response: response.move)
        move = speciesBusinessModel
    }
}


// MARK: - Sprites
class SpritesBusinessModel: Codable {
    let backDefault, backFemale, backShiny: String
    let backShinyFemale: String?
    let frontDefault, frontFemale, frontShiny, frontShinyFemale: String


    init(response: SpritesResponse) {
        backFemale = response.backFemale
        backShiny = response.backShiny
        backDefault = response.backDefault
        backShinyFemale = response.backShinyFemale
        frontDefault = response.frontDefault
        frontFemale = response.frontFemale
        frontShiny = response.frontShiny
        frontShinyFemale = response.frontShinyFemale
    }
}

struct StatBusinessModel: Codable {
    let baseStat, effort: Int
    let stat: SpeciesBusinessModel

    init(response: StatResponse) {
        baseStat = response.baseStat
        effort = response.effort
        let stat = SpeciesBusinessModel(response: response.stat)
        self.stat = stat
    }
}
