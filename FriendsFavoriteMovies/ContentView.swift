//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by MacBook Air on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            FilteredMovieList()
                .tabItem{
                    Label("Movie", systemImage: "film.stack")
                }
            FriendList()
                .tabItem{
                    Label("Friend", systemImage: "figure.baseball")
        }
        
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
