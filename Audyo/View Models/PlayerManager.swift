//
//  PlayerManager.swift
//  Audyo
//
//  Created by Jonathan Gikabu on 21/08/2021.
//

import Foundation
import AudioStreaming

class PlayerManager: ObservableObject {
    @Published var episodes = (Episode.sampleList() + Episode.sampleList()).shuffled()
    @Published var playingItem: Episode?
    @Published var seekTime: Int = 0
    let audioPlayer = AudioPlayer()
    
    func selectItem(episode: Episode) {
        dismissPlayer()
        self.playingItem = episode
    }
    
    func dismissPlayer() {
        self.playingItem = nil
        self.seekTime = 0
    }
}
