//
//  GuessTabView.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/26/23.
//

import SwiftUI

struct GuessTabView: View {
    @Environment(Game.self) private var game
    @State var isSearching: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            PlayersListView(isSearching: $isSearching)
            if(!isSearching){
//                GuessesListView()
                VStack{
                    Text("Last Guess")
                        .font(.headline)
                        .bold()
                }
                if  game.guesses.last != nil {
                    HStack{
                        Text("#\(game.guesses.count)")
                            .bold()
                        PlayerGuessView(guessedPlayer: game.guesses.last!, targetPlayer: game.targetPlayer)
                    }
                    .padding()
                }
                else{
                    PlayerGuessView(guessedPlayer: game.modelData.players[0], targetPlayer: game.targetPlayer)
                        .opacity(0)
                        .padding()
                }
                AllStatsRangeView()
            }
        }
    }
}

#Preview {
    GuessTabView()
        .environment(Game(modelData: ModelData()))
}
