import Foundation

struct Team : Identifiable, Equatable, Codable, Hashable {
    let id = UUID()
    let icon: String
    let name: String
    var score: Int
}
