class TrainingViewModel: ObservableObject {
    @Published var tiles: [Tile] = []
    let gridSize = 4

    init() {
        resetGame()
    }

    func resetGame() {
        // Generate numbers from 1 to 15 and add one empty cell
        var numbers = (1...15).map { $0 }
        numbers.shuffle()
        numbers.append(0) // Add the empty cell (represented as 0)

        tiles = numbers.enumerated().map { index, value in
            Tile(id: index, value: value == 0 ? nil : value)
        }
    }

    func moveTile(at index: Int) {
        // Get the row and column of the tapped tile
        let tappedRow = index / gridSize
        let tappedCol = index % gridSize

        // Find the empty cell
        guard let emptyIndex = tiles.firstIndex(where: { $0.value == nil }) else { return }
        let emptyRow = emptyIndex / gridSize
        let emptyCol = emptyIndex % gridSize

        // Check if the tapped tile is adjacent to the empty cell
        let isAdjacent = (tappedRow == emptyRow && abs(tappedCol - emptyCol) == 1) ||
                         (tappedCol == emptyCol && abs(tappedRow - emptyRow) == 1)

        if isAdjacent {
            // Swap the tapped tile with the empty cell
            tiles.swapAt(index, emptyIndex)

            // Check if the player has won
            if isGameCompleted() {
                print("You Win!")
                resetGame()
            }
        }
    }

    func isGameCompleted() -> Bool {
        // The tiles should be in order from 1 to 15, with the empty cell at the end
        for i in 0..<tiles.count - 1 {
            if tiles[i].value != i + 1 {
                return false
            }
        }
        return tiles.last?.value == nil
    }
}
