//
//  StatView.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/26/23.
//

import SwiftUI

struct StatView: View {
    var statName: String
    var guessedValue: Int
    var targetValue: Int
    var body: some View {
        VStack(alignment: .leading){
            Text("\(statName)")
                .font(.caption)
                .bold()
            HStack{
                Text("\(guessedValue)")
                if(guessedValue < targetValue){
                    Image(systemName: "arrowtriangle.up.fill")
                        .foregroundStyle(.green)
                }
                else if(guessedValue > targetValue){
                    Image(systemName: "arrowtriangle.down.fill")
                        .foregroundStyle(.red)
                }
                else {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.green)
                }
            }
        }
    }
    
    init(_ statName: String, guessedValue: Int, targetValue: Int) {
        self.statName = statName
        self.guessedValue = guessedValue
        self.targetValue = targetValue
    }
}

#Preview {
    StatView("Pace", guessedValue: 95, targetValue: 90)
}
