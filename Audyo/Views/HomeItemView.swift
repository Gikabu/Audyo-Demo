//
//  HomeItemView.swift
//  Audyo
//
//  Created by Jonathan Gikabu on 21/08/2021.
//

import SwiftUI

struct HomeItemView: View {
    @EnvironmentObject var playerManager: PlayerManager
    let episode: Episode
    
    var body: some View {
        Button(action: { onItemClicked() }, label: {
            VStack(spacing: 10) {
                HStack {
                    Text("For you")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                    
                    Image(systemName: "circlebadge.fill")
                        .resizable()
                        .frame(width: 3, height: 3, alignment: .center)
                        .foregroundColor(.secondary)
                    
                    Text("\(episode.duration) minutes listen")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                }
                .lineLimit(1)
                
                Text(episode.title)
                    .font(.title)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .padding(.horizontal)
                
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 50, height: 3, alignment: .center)
                
                Text(episode.series)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                (Text(episode.publisher) + Text(", ") + Text(episode.timestamp))
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Divider()
            }
            .multilineTextAlignment(.center)
        })
    }
    
    func onItemClicked() {
        self.playerManager.selectItem(episode: episode)
    }
}

struct HomeItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeItemView(episode: Episode())
    }
}
