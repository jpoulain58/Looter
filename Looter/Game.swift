//
//  Game.swift
//  Looter
//
//  Created by Jeremy POULAIN on 1/19/24.
//

import SwiftUI

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "3.png"),
    Game(name: "Skyrim", genre: .rpg, coverName: "4.png"),
    Game(name: "WoW", genre: .mmorpg, coverName: "5.png"),
    Game(name: "CS:GO", genre: .fps, coverName: "1.png"),
    Game(name: "Diablo IV", genre: .looter, coverName: "2.png")
]
