//
//  ResetButtonView.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/26/23.
//

import SwiftUI

struct ResetButtonView: View {
    @Environment(Game.self) private var game
    var body: some View {
        Button{
            game.guesses = []
            game.targetPlayer = game.modelData.players.randomElement()!
        }
    label: {
        Image(systemName: "arrow.clockwise")
    }
        
    }
}

#Preview {
    ResetButtonView()
        .environment(Game(modelData: ModelData()))
}
