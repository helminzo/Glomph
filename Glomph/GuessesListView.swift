//
//  GuessesView.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/26/23.
//

import SwiftUI

struct GuessesListView: View {
    @Environment(Game.self) var game
    var body: some View {
            VStack(alignment: .leading) {
                Text("Guesses")
                    .font(.headline)
                    .bold()
                List{
                    ForEach(Array(stride(from: game.guesses.count - 1, through: 0, by: -1)), id: \.self){ i in
                        let guessedPlayer = game.guesses[i]
                        HStack{
                            Text("#\(i + 1)")
                                .bold()
                            PlayerGuessView(guessedPlayer: guessedPlayer, targetPlayer: game.targetPlayer)
                        }
                    }
                }
                .listStyle(.plain)
            }
    }
}

#Preview {
    GuessesListView()
        .environment(Game(modelData: ModelData()))
}
