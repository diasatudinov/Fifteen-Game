import SwiftUI

class TeamViewModel: ObservableObject {
    @Published var teams: [Team] = [
        Team(icon: "team1Logo", name: "Team Isleta", score: 0),
        Team(icon: "team2Logo", name: "Vectors Team", score: 0),
        Team(icon: "team3Logo", name: "Glory Team", score: 0)
        
    ] {
        didSet {
            saveArray()
        }
    }
    
    @Published var currentTeam: Team? = Team(icon: "team1Logo", name: "Team Isleta", score: 0) {
        didSet {
            saveTeam()
        }
    }
    
    init() {
        
        loadTeam()
        loadArray()
    }
    private let userDefaultsTeamKey = "currentTeam"
    private let userDefaultsArrayKey = "teams"

    
    func addScore(points: Int) {
        if let index = teams.firstIndex(where: { $0.name == currentTeam?.name }) {
            teams[index].score += points
        }
    }
    
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
    
    
    func saveArray() {
            if let encodedData = try? JSONEncoder().encode(teams) {
                UserDefaults.standard.set(encodedData, forKey: userDefaultsArrayKey)
            }
        
    }
    
    func loadArray() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsArrayKey),
           let loadedArray = try? JSONDecoder().decode([Team].self, from: savedData) {
            teams = loadedArray
        } else {
            print("No saved data found")
        }
    }
    
}
