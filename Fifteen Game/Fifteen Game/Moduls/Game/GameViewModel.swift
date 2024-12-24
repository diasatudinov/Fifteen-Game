//
//  GameViewModel.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 24.12.2024.
//


import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    @Published var tiles: [Tile] = []
    @Published var opponentsTiles: [Tile] = []
    @Published var isWin = false
    @Published var youLose = false
    
    let gridSize = 4
    
    @Published var elapsedTime: String = "00:00"
    private var timer: AnyCancellable?
    private var opponentTimer: Timer?
    private var startTime: Date?
    private var pausedTime: TimeInterval = 0
    private var isTimerRunning = false
    
    @AppStorage("lastScoreTime") var scoreTime: String = "00:00"
    
    init() {
        resetGame()
    }
    
    func resetGame() {
        // Stop the timer and reset time
        timer?.cancel()
        isTimerRunning = false
        elapsedTime = "00:00"
        pausedTime = 0
        // Generate numbers from 1 to 15 and add one empty cell
        var numbers = (1...15).map { $0 }
        numbers.shuffle()
        numbers.append(0) // Add the empty cell (represented as 0)
        
        tiles = numbers.enumerated().map { index, value in
            Tile(id: index, value: value == 0 ? nil : value)
        }
        
        opponentsTiles = numbers.enumerated().map { index, value in
            Tile(id: index, value: value == 0 ? nil : value)
        }
        startOpponent()
        
        // Start the timer on the first move
        if !isTimerRunning {
            timer?.cancel()
            startTimer()
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
                
                stopTimer()
                
                if isNewRecord(currentTime: elapsedTime, recordTime: scoreTime) {
                
                } else {
                    isWin = true
                }
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
    
    func isOpponentsGameCompleted() -> Bool {
        // The tiles should be in order from 1 to 15, with the empty cell at the end
        for i in 0..<opponentsTiles.count - 1 {
            if opponentsTiles[i].value != i + 1 {
                return false
            }
        }
        return opponentsTiles.last?.value == nil
    }
    
    func startTimer() {
        isTimerRunning = true
        startTime = Date()
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateElapsedTime()
            }
    }
    
    func pauseTimer() {
        guard isTimerRunning else { return }
        stopTimer()
        if let startTime = startTime {
            pausedTime += Date().timeIntervalSince(startTime)
        }
    }
    
    func resumeTimer() {
        guard !isTimerRunning else { return }
        startTimer()
    }
    
    func stopTimer() {
        timer?.cancel()
        isTimerRunning = false
    }
    
    private func updateElapsedTime() {
        guard let startTime = startTime else { return }
        let elapsed = Int(Date().timeIntervalSince(startTime) + pausedTime)
        let minutes = elapsed / 60
        let seconds = elapsed % 60
        elapsedTime = String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    private func isNewRecord(currentTime: String, recordTime: String) -> Bool {
        let currentComponents = currentTime.split(separator: ":").compactMap { Int($0) }
        let recordComponents = recordTime.split(separator: ":").compactMap { Int($0) }

        guard currentComponents.count == 2, recordComponents.count == 2 else {
            return false
        }

        let currentSeconds = currentComponents[0] * 60 + currentComponents[1]
        let recordSeconds = recordComponents[0] * 60 + recordComponents[1]

        return currentSeconds < recordSeconds || recordTime == "00:00"
    }
    
    private func startOpponent() {
        stopOpponent()
        opponentTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.opponentMove()
        }
    }
    
    private func stopOpponent() {
        opponentTimer?.invalidate()
    }
    
    private func getAdjacentIndices(for index: Int) -> [Int] {
            let row = index / gridSize
            let col = index % gridSize
            var indices: [Int] = []

            if row > 0 { indices.append(index - gridSize) }        // Top
            if row < gridSize - 1 { indices.append(index + gridSize) } // Bottom
            if col > 0 { indices.append(index - 1) }              // Left
            if col < gridSize - 1 { indices.append(index + 1) }   // Right

            return indices
        }
    
    private func handleGameOver(isOpponent: Bool = false) {
            stopTimer()
            stopOpponent()
            if isOpponent {
                youLose = true
            } else if isNewRecord(currentTime: elapsedTime, recordTime: scoreTime) {
        
            } else {
                isWin = true
            }
        }
    
    private func opponentMove() {
        guard let emptyIndex = opponentsTiles.firstIndex(where: { $0.value == nil }) else { return }
        
        // Find all possible moves for the opponent
        let adjacentIndices = getAdjacentIndices(for: emptyIndex)
        if let randomMove = adjacentIndices.randomElement() {
            opponentsTiles.swapAt(randomMove, emptyIndex)
            
            // Check if the opponent has won
            if isGameCompleted() {
                handleGameOver(isOpponent: true)
            }
        }
    }
    
    
}
