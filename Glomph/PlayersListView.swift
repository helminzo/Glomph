//
//  PlayersListView.swift
//  Glomph
//
//  Created by Helmin Jinoz on 11/25/23.
//

import SwiftUI

struct PlayersListView: View {
    @Environment(Game.self) var game
    @Environment(\.dismissSearch) private var dismissSearch
    @State var searchString: String = ""
    @FocusState private var isFocused: Bool
    @Binding var isSearching: Bool
    var body: some View {

            VStack(alignment: .leading){
                HStack{
                    TextField("Your guess", text: $searchString, onEditingChanged: { isEditing in
                        self.isSearching = isEditing
                    })
                        .textFieldStyle(.roundedBorder)
                        .focused($isFocused)
                    ResetButtonView()
                }
                if(isSearching){
                    listView
                }
                
            }
    }
    
    var listView: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                    let filteredPlayers = game.modelData.players.filter { player in
                        player.long_name.localizedCaseInsensitiveContains(searchString)
                        || player.short_name.localizedCaseInsensitiveContains(searchString)
                        || searchString == "sahafkunna" && player.long_name == game.targetPlayer.long_name
                    }
                    ForEach(filteredPlayers, id: \.self){ player in
                        Button{
                                let alreadyPresent = game.guesses.firstIndex(of: player) != nil
                                if(!alreadyPresent){
                                    game.guesses.append(player)
                                    print(game.guesses)
                                }
                                searchString = ""
                                isFocused = false
                        }
                    label: {
                        VStack(alignment: .leading){
                            PlayerSearchResultView(player: player)
                                .padding(.vertical)
                            Divider()
                        }
                    }
                    .buttonStyle(.plain)
                    }
                }
    //                    .searchable(text: $searchString)
                .navigationTitle("footle")
            .listStyle(.plain)
        }
    }
}

#Preview {
    PlayersListView(isSearching: .constant(true))
        .environment(Game(modelData: ModelData()))
}
