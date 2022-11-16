//
//  ConstructPokemon.swift
//  Gen1Pokedex
//
//  Created by Consultant on 11/13/22.
//

import Foundation

struct ConstructPokemon: Decodable {
    
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [NameLink]
    let gameIndices: [GameIndex]
    let height: Int
    let heldItems: [HeldItems]
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [Move]
    let name: String
    let order: Int
    let pastTypes: [NameLink]
    let species: NameLink
    let sprites: Sprites
    let stats: [Stats]
    let types: [Types]
    let weight: Int
    
    enum CodingKeys: String, CodingKey {
        case baseExperience = "base_experience"
        case gameIndices = "game_indices"
        case heldItems = "held_items"
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case pastTypes = "past_types"
        case abilities, forms, height, id, moves, name, order, species, sprites, stats, types, weight
    }
}

struct Ability: Decodable {
    
    let ability: NameLink
    let isHidden: Bool
    let slot: Int
    
    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case ability, slot
    }
}
struct GameIndex: Decodable {
    
    let gameIndex: Int
    let version: NameLink
    
    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

struct HeldItems: Decodable {
    
    let item: NameLink
    let versionDetails: [VersionDetail]
    
    enum CodingKeys: String, CodingKey {
        case versionDetails = "version_details"
        case item
    }
}

struct VersionDetail: Decodable {
    
    let rarity: Int
    let version: NameLink
    
    enum CodingKeys: String, CodingKey {
        case rarity, version
    }
}

struct Move: Decodable {
    
    let move: NameLink
    let versionGroupDetails: [VersionGroupDetails]
    
    enum CodingKeys: String, CodingKey {
        case versionGroupDetails = "version_group_details"
        case move
    }
}

struct VersionGroupDetails: Decodable {
    
    let levelLearnedAt: Int
    let moveLearnMethod: NameLink
    let versionGroup: NameLink
    
    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

struct Sprites: Decodable {
    
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    let other: SpriteOther
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other
    }
}

struct SpriteOther: Decodable {
    
    let dreamWorld: DreamWorld
    let home: Home
    let officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official-artwork"
        case home
    }
}

struct DreamWorld: Decodable {
    
    let frontDefault: String?
    let frontFemale: String?
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}

struct Home: Decodable {
    
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

struct OfficialArtwork: Decodable {
    
    let frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct Stats: Decodable {
    
    let baseStat: Int
    let effort: Int
    let stat: NameLink
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

struct Types: Decodable {
    
    let slot: Int
    let type: NameLink
    enum CodingKeys: String, CodingKey {
        case slot, type
    }
}
