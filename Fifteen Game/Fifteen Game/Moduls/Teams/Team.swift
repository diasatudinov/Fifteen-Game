//
//  Team.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 23.12.2024.
//


import Foundation

struct Team : Identifiable, Equatable, Codable, Hashable {
    let id = UUID()
    let icon: String
    let name: String
}
