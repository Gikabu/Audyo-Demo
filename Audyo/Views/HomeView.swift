//
//  HomeView.swift
//  Audyo
//
//  Created by Jonathan Gikabu on 21/08/2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var playerManager: PlayerManager
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(playerManager.episodes, id: \.self) { episode in
                        HomeItemView(episode: episode)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
