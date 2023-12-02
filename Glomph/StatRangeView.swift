//
//  StatRangeView.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/26/23.
//

import SwiftUI

struct StatRangeView: View {
    var statName: String
    var lowerBound: Int
    var upperBound: Int
    static var colors = [Color(red: 0.4, green: 0.0, blue: 0.2), Color(red: 0.7, green: 0.0, blue: 0.2)]
    var body: some View {
        
            
            HStack {
                Text(statName)
                    .bold()
                    .padding(.horizontal)
                if(lowerBound != upperBound){
                    Text("\(lowerBound)")
                        .font(.caption)
                }
                
                GeometryReader { geometry in
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 3.0)
                        .fill(.background)
                    RoundedRectangle(cornerRadius: 3.0)
                        .stroke(.gray)
                    if(lowerBound != upperBound){
                        Rectangle()
                            .fill(LinearGradient(colors: StatRangeView.colors, startPoint: UnitPoint(x: 0.0, y: 0.5), endPoint: UnitPoint(x: 1.0, y: 0.5)))
                            .clipShape(RoundedRectangle(cornerRadius: 3.0))
                            .frame(width: (CGFloat(upperBound - lowerBound)) / 100 * geometry.size.width)
                            .offset(x: CGFloat(lowerBound) / 100 * geometry.size.width)
                    }
                    else{
                        ZStack{
                        RoundedRectangle(cornerRadius: 3.0)
                            .fill(.green)
                        Text("\(lowerBound)")
                                .font(.title)
                                .bold()
                        }
                    }
                }
            }
                if(lowerBound != upperBound){
                    Text("\(upperBound)")
                        .font(.caption)
                }
            }
        .padding()
    }
}

#Preview {
    StatRangeView(statName: "PAC", lowerBound: 20, upperBound: 20)
}
