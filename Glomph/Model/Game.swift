//
//  Game.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/26/23.
//

import Foundation

@Observable
class Game{
    var targetPlayer: Player
    var guesses: [Player]
    var modelData: ModelData
    init(modelData: ModelData, targetPlayer: Player? = nil) {
        self.modelData = modelData
        if(targetPlayer == nil){
            self.targetPlayer = modelData.players.randomElement()!
        }
        else{
            self.targetPlayer = targetPlayer!
        }
        self.guesses = []
    }
}
