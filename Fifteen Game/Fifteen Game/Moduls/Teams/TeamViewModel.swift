//
//  TeamViewModel.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 23.12.2024.
//


import SwiftUI

class TeamViewModel: ObservableObject {
    @Published var teams: [Team] = [
        Team(icon: "team1Logo1", name: "Tulalip Team"),
        Team(icon: "team1Logo2", name: "Avrora Team"),
        Team(icon: "team1Logo3", name: "Arax Team"),
        Team(icon: "team1Logo4", name: "Vendetta team"),
        Team(icon: "team1Logo5", name: "Tereria Team")
        
    ]
    
    @Published var currentTeam: Team? {
        didSet {
            saveTeam()
        }
    }
    
    init() {
        loadTeam()
    }
    private let userDefaultsTeamKey = "currentTeam"
    
    func saveTeam() {
        if let currentTeam = currentTeam {
            if let encodedData = try? JSONEncoder().encode(currentTeam) {
                UserDefaults.standard.set(encodedData, forKey: userDefaultsTeamKey)
            }
        }
    }
    
    func loadTeam() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsTeamKey),
           let loadedTeam = try? JSONDecoder().decode(Team.self, from: savedData) {
            currentTeam = loadedTeam
        } else {
            print("No saved data found")
        }
    }
    
}
