//
//  GlomphApp.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/25/23.
//

import SwiftUI

@main
struct GlomphApp: App {
    var game = Game(modelData: ModelData())
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(game)
        }
    }
}
