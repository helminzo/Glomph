//
//  ContentView.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView{
                GuessTabView()
                    .tabItem {
                        Label("Guess", systemImage: "pencil")
                    }
                GuessesListView()
                    .tabItem {
                        Label("Information", systemImage: "number")
                    }
            }
    }
}

#Preview {
    ContentView()
        .environment(Game(modelData: ModelData()))
}
