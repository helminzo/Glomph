//
//  AllStatsRangeView.swift
//  Glomph
//
//  Created by Helmin Jinoz on 12/1/23.
//

import SwiftUI

struct AllStatsRangeView: View {
    @Environment(Game.self) private var game
    
    var body: some View{
        VStack(alignment: .leading) {
            Text("Player Stats")
                .font(.title)
                .bold()
                
            VStack{
                let paceBounds = getBounds(guesses: game.guesses.map({ player in
                    player.pace
                }), target: game.targetPlayer.pace)
                StatRangeView(statName: "PAC", lowerBound: paceBounds[0], upperBound: paceBounds[1])
                
                let shootingBounds = getBounds(guesses: game.guesses.map({ player in
                    player.shooting
                }), target: game.targetPlayer.shooting)
                StatRangeView(statName: "SHO", lowerBound: shootingBounds[0], upperBound: shootingBounds[1])
                
                let dribblingBounds = getBounds(guesses: game.guesses.map({ player in
                    player.dribbling
                }), target: game.targetPlayer.dribbling)
                StatRangeView(statName: "DRB", lowerBound: dribblingBounds[0], upperBound: dribblingBounds[1])
                
                let passingBounds = getBounds(guesses: game.guesses.map({ player in
                    player.passing
                }), target: game.targetPlayer.passing)
                StatRangeView(statName: "PAS", lowerBound: passingBounds[0], upperBound: passingBounds[1])
                
                let defendingBounds = getBounds(guesses: game.guesses.map({ player in
                    player.defending
                }), target: game.targetPlayer.defending)
                StatRangeView(statName: "DEF", lowerBound: defendingBounds[0], upperBound: defendingBounds[1])
                
                let physicBounds = getBounds(guesses: game.guesses.map({ player in
                    player.physic
                }), target: game.targetPlayer.physic)
                StatRangeView(statName: "PHY", lowerBound: physicBounds[0], upperBound: physicBounds[1])
                
                
            }
        }
    }
    
    func getBounds(guesses: [Int], target: Int) -> [Int] {
        var lowerBound = 0
        var upperBound = 100
        for guess in guesses{
            if(guess < target && guess > lowerBound){
                lowerBound = guess
            }
            else if(guess > target && guess < upperBound){
                upperBound = guess
            }
            else if(guess == target){
                return [target, target]
            }
        }
        return [lowerBound, upperBound]
    }
}

#Preview {
    AllStatsRangeView()
        .environment(Game(modelData: ModelData()))
}
