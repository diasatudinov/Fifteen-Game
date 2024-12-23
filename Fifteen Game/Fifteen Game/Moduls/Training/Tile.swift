//
//  Tile.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 23.12.2024.
//

import Foundation

struct Tile: Identifiable {
    let id: Int
    let value: Int? // `nil` for the empty cell
}
