//
//  PlayerView.swift
//  Audyo
//
//  Created by Jonathan Gikabu on 21/08/2021.
//

import SwiftUI
import AudioStreaming

struct PlayerView: View {
    @EnvironmentObject var playerManager: PlayerManager
    @State var episode: Episode
    @State private var progress: Int = 0
    @State private var timer: Timer? = nil
    @State private var showPause = false
    @State private var didStart = false
    
    private var audioPlayer: AudioPlayer {
        return playerManager.audioPlayer
    }
    
    private var totalTime: Double {
        return Double(episode.duration * 60)
    }
    
    var body: some View {
        VStack {
            ProgressView(value: Double(progress), total: totalTime)
                .accentColor(.orange)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(episode.title)
                        .lineLimit(1)
                    
                    Text(episode.series)
                        .font(.caption)
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button(action: { showPause ? pause() : play() }, label: {
                    Image(systemName: showPause ? "pause" : "play")
                        .imageScale(.large)
                        .foregroundColor(.orange)
                })
                .padding(.horizontal, 8)
                
                Button(action: { dismissPlayer() }, label: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .foregroundColor(.secondary)
                })
                .padding(.trailing, 8)
                
            }
            .padding(.horizontal)
        }
        .frame(height: 60, alignment: .center)
        .background(Color(UIColor.secondarySystemBackground))
        .onChange(of: playerManager.playingItem, perform: { value in
            if let item = value {
                didStart = false
                self.episode = item
                play()
            }
        })
    }
    
    func play() {
        if didStart {
            resume()
        } else {
            if let fileUrl = URL(string: episode.url) {
                showPause = true
                audioPlayer.play(url: fileUrl)
                updateSeekBar()
                didStart = true
            }
        }
    }
    
    func pause() {
        showPause = false
        audioPlayer.pause()
        timer?.invalidate()
        timer = nil
    }
    
    func resume() {
        showPause = true
        audioPlayer.resume()
        updateSeekBar()
    }
    
    func updateSeekBar() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            progress = Int(audioPlayer.progress)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if progress > Int(totalTime) {
                    resetPlayer()
                }
            }
        }
    }
    
    private func resetPlayer() {
        showPause = false
        audioPlayer.stop()
        timer?.invalidate()
        timer = nil
        progress = 0
    }
    
    func dismissPlayer() {
        playerManager.dismissPlayer()
        resetPlayer()
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(episode: Episode())
            .environmentObject(PlayerManager())
    }
}
