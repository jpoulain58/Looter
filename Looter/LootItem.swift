//
//  LootItem.swift
//  Looter
//
//  Created by Jeremy POULAIN on 1/19/24.
//

import SwiftUI

enum ItemType:String, CaseIterable{
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
    }

struct LootItem: Identifiable{
    var id: UUID = UUID()
    var quantity: Int = 1
    var name: String = ""
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game
}

enum Rarity: CaseIterable {
    case common
    case uncommon
    case rare
    case epic
    case legendary
    case unique
    
    func colorForRarity() -> Color {
        switch self {
        case .common:
            return Color.gray
        case .uncommon:
            return Color.blue
        case .rare:
            return Color.green
        case .epic:
            return Color.purple
        case .legendary:
            return Color.yellow
        case .unique:
            return Color.red
        }
    }
}


let testLootItems: [LootItem] = [
    LootItem(name: "Épée enflammée", type: .dagger, rarity: .rare, attackStrength: 20, game: availableGames[0]),
    LootItem(name: "Bouclier glacial", type: .shield, rarity: .epic, attackStrength: nil, game: availableGames[1]),
    LootItem(name: "Armure de l'ombre", type: .shield, rarity: .legendary, attackStrength: nil, game: availableGames[2]),
    LootItem(name: "Dague empoisonnée", type: .dagger, rarity: .common, attackStrength: 15, game: availableGames[3]),
    LootItem(name: "Arc du tonnerre", type: .bow, rarity: .uncommon, attackStrength: 25, game: availableGames[4]),
    LootItem(name: "Anneau mystique", type: .ring, rarity: .rare, attackStrength: nil, game: availableGames[0]),
    LootItem(name: "Lame des vents", type: .dagger, rarity: .epic, attackStrength: 30, game: availableGames[1]),
    LootItem(name: "Bouclier divin", type: .shield, rarity: .legendary, attackStrength: nil, game: availableGames[2]),
    LootItem(name: "Armure du chaos", type: .shield, rarity: .unique, attackStrength: nil, game: availableGames[3]),
    LootItem(name: "Dague éthérée", type: .dagger, rarity: .rare, attackStrength: 18, game: availableGames[4])
]
