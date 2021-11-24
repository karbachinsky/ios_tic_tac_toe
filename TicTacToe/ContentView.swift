//
//  ContentView.swift
//  TicTacToe
//
//  Created by Igor on 02.11.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: TicTacToeVM
    
    var columns: [GridItem] {
        var x: [GridItem] = []
        for _ in 0..<game.size {
            x.append(GridItem());
        }
        return x
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(
                    columns: columns
                )
                {
                    ForEach(0..<game.size) { i in
                        ForEach(0..<game.size) { j in
                            CardView(cell: game.cells[i][j]).aspectRatio(
                                1/1, contentMode: .fit
                            ).onTapGesture {
                                game.makeMove(cell: game.cells[i][j])
                            }
                        }
                    }
                }
                    
            }
            Spacer()
            Text("\(game.statusText)")
                .font(.largeTitle)
                .fontWeight(.light)
            if game.state != .GameContinues {
                Button("New Game") {
                    game.new()
                }
            }
        }.padding()
    }
}


struct CardView: View {
    var cell: TicTacToeModel.Cell
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(
                cornerRadius: 25.0
            )
            shape
            if cell.value == 1 {
                Text("X")
                    .foregroundColor(Color.white)
            }
            else if cell.value == -1 {
                Text("0")
                    .foregroundColor(Color.white)
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}



struct ContentView_Previews: PreviewProvider {
    var game: TicTacToeVM
    
    static var previews: some View {
        ContentView(game: TicTacToeVM())
    }
}
