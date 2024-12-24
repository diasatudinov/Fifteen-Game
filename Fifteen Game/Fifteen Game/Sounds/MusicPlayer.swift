//
//  MusicPlayer.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 24.12.2024.
//


import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?

    func playBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "gameMusic", withExtension: "mp3") else { return }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // Infinite loop
            audioPlayer?.play()
        } catch {
            print("Could not play background music: \(error)")
        }
    }

    func stopBackgroundMusic() {
        audioPlayer?.stop()
    }
}