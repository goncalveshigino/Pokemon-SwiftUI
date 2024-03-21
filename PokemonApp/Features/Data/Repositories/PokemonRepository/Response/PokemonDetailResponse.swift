// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailPokemonResponse = try? JSONDecoder().decode(DetailPokemonResponse.self, from: jsonData)

import Foundation

// MARK: - DetailPokemonResponse
struct DetailPokemonResponse: Codable {
    let abilities: [AbilityResponse]
    let height: Int
    let id: Int
    let moves: [MoveResponse]
    let name: String
    let species: SpeciesResponse
    let sprites: SpritesResponse
    let stats: [StatResponse]
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case height
        case id
        case moves, name
        case species, sprites, stats, weight
    }
}

// MARK: - Ability
struct AbilityResponse: Codable {
    let ability: SpeciesResponse
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Species
struct SpeciesResponse: Codable {
    let name: String
    let url: String
}


// MARK: - Move
struct MoveResponse: Codable {
    let move: SpeciesResponse
    let versionGroupDetails: [VersionGroupDetailResponse]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetailResponse: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: SpeciesResponse

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}
// MARK: - Sprites
class SpritesResponse: Codable {
    let backDefault, backFemale, backShiny: String
    let backShinyFemale: String?
    let frontDefault, frontFemale, frontShiny, frontShinyFemale: String
    let animated: SpritesResponse?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case animated
    }

    init(backDefault: String, backFemale: String, backShiny: String, backShinyFemale: String?, frontDefault: String, frontFemale: String, frontShiny: String, frontShinyFemale: String, animated: SpritesResponse?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.animated = animated
    }
}



// MARK: - Stat
struct StatResponse: Codable {
    let baseStat, effort: Int
    let stat: SpeciesResponse

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}
