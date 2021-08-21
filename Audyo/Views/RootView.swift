//
//  RootView.swift
//  Audyo
//
//  Created by Jonathan Gikabu on 21/08/2021.
//

import SwiftUI

struct RootView: View {
    @StateObject var playerManager: PlayerManager = PlayerManager()
    @State private var selection = 1
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                TabContentView {
                    Spacer()
                    Text("Some List")
                }
                .tabItem {
                    Image(systemName: "square.grid.3x3.fill")
                }
                .tag(0)
                    
                TabContentView {
                    HomeView()
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(1)
                
                TabContentView {
                    Spacer()
                    Text("Some List")
                }
                .tabItem {
                    Image(systemName: "person.3")
                }
                .tag(2)
            }
            .accentColor(.primary)
            .environmentObject(playerManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
