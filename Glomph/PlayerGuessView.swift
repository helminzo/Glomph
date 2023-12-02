//
//  PlayerGuessView.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/26/23.
//

import SwiftUI

struct PlayerGuessView: View {
    var guessedPlayer: Player
    var targetPlayer: Player
    var body: some View {
        VStack(alignment: .leading){
        
            HStack {
                PlayerSearchResultView(player: guessedPlayer)
                Spacer()
                VStack(alignment: .leading){
                    OverallStatView("OVR", guessedValue: guessedPlayer.overall, targetValue: targetPlayer.overall)
                        
                    HStack{
                        Text("NAT")
                            .font(.headline)
                        if(guessedPlayer.nationality_name != targetPlayer.nationality_name){
                            Image(systemName: "x.circle")
                                .foregroundStyle(.red)
                        }
                        else{
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.green)
                        }
                    }
                    HStack{
                        Text("LEG")
                            .font(.headline)
                        if(guessedPlayer.league_name != targetPlayer.league_name){
                            Image(systemName: "x.circle")
                                .foregroundStyle(.red)
                        }
                        else{
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.green)
                        }
                    }
                }
            }
            LazyVGrid(columns: [GridItem(.fixed(50)), GridItem(.fixed(50)), GridItem(.fixed(50))], alignment: .leading) {
                StatView("PAC", guessedValue: guessedPlayer.pace, targetValue: targetPlayer.pace)
                StatView("SHO", guessedValue: guessedPlayer.shooting, targetValue: targetPlayer.shooting)
                StatView("DRB", guessedValue: guessedPlayer.dribbling, targetValue: targetPlayer.dribbling)
                StatView("PAS", guessedValue: guessedPlayer.passing, targetValue: targetPlayer.passing)
                StatView("DEF", guessedValue: guessedPlayer.defending, targetValue: targetPlayer.defending)
                StatView("PHY", guessedValue: guessedPlayer.physic, targetValue: targetPlayer.physic)
            }
            
        }
    }
}

#Preview {
    let md = ModelData()
    return PlayerGuessView(guessedPlayer: md.players[0], targetPlayer: md.players[1])
}
