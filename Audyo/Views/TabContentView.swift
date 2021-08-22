//
//  TabContentView.swift
//  Audyo
//
//  Created by Jonathan Gikabu on 21/08/2021.
//

import SwiftUI
import AudioStreaming

struct TabContentView<Content>: View where Content: View {
    @EnvironmentObject var playerManager: PlayerManager
    
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            VStack(spacing: 0) {
                header
                content()
                Spacer()
            }
            .edgesIgnoringSafeArea([.bottom])
            
            if let episode = playerManager.playingItem {
                PlayerView(episode: episode)
            }
        }
        .navigationBarHidden(true)
    }
    
    var header: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Button(action: {  }, label: {
                    Image(systemName: "line.horizontal.3.circle")
                        .imageScale(.large)
                        .foregroundColor(.secondary)
                })
                
                
                Spacer()
                HStack {
                    Image("audyo_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 36, alignment: .center)
                        .background(
                            Circle()
                                .foregroundColor(.white)
                                .padding(3)
                        )
                    Text("audyo")
                        .font(.custom("ubuntu-bold", size: 36, relativeTo: .body))
                }
                Spacer()
                Button(action: {  }, label: {
                    Image(systemName: "person")
                        .imageScale(.large)
                        .foregroundColor(.secondary)
                })
            }
            .frame(maxHeight: 48)
            .padding(.horizontal)
            
            Divider()
        }
    }
}

struct TabContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabContentView {
            Spacer()
            Text("Content")
        }
        .environmentObject(PlayerManager())
    }
}
