//
//  Player.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/25/23.
//

import Foundation

struct Player: Codable, Hashable {
    var short_name: String
    var long_name: String
    var player_positions: String
    var wage_eur: Int
    var height_cm: Int
    var club_name: String
    var league_name: String
    var nationality_name: String
    
    // Stats
    var overall: Int
    var pace: Int
    var shooting: Int
    var passing: Int
    var dribbling: Int
    var defending: Int
    var physic: Int
}
