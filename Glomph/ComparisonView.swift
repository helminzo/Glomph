//
//  ComparisonView.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/26/23.
//

import SwiftUI

struct ComparisonView: View {
    var guessedPlayer: Player
    var targetPlayer: Player
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let md = ModelData()
    return ComparisonView(guessedPlayer: md.players[0], targetPlayer: md.players[1])
}
