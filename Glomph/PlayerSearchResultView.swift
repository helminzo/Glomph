//
//  PlayerSearchResultView.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/25/23.
//

import SwiftUI

struct PlayerSearchResultView: View {
    var player: Player
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(player.short_name)
                    .bold()
                Text(player.player_positions)
                    .font(.caption)
                let flagEmoji = FlagEmojis.countryFlags[player.nationality_name]
                if let flagEmoji {
                    Text(flagEmoji)
                }
                else{
                    Text(player.nationality_name)
                }
            }
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(player.league_name)
                        .font(.caption2)
                        .foregroundStyle(.gray)
                    Text(player.club_name)
                }
                
            }
            .padding(.top, 0)
        }
    }
}

#Preview {
    PlayerSearchResultView(
        player: Player(short_name: "H. Jinoz", long_name: "Helmin Jinoz", player_positions: "ST, LW, GK", wage_eur: 350000, height_cm: 180, club_name: "Barcelona", league_name: "La Liga", nationality_name: "India", overall: 93, pace: 92, shooting: 98, passing: 90, dribbling: 95, defending: 99, physic: 78)
    )
}
