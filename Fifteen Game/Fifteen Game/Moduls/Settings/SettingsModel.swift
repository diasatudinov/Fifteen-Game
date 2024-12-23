//
//  SettingsModel.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 23.12.2024.
//


import SwiftUI

class SettingsModel: ObservableObject {
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("musicEnabled") var musicEnabled: Bool = true
}