//
//  ViewModel.swift
//
//
//  Created by Igor on 10.11.2021.
//

import Foundation

class TicTacToeVM: ObservableObject {
    static func getNewModel() -> TicTacToeModel {
        TicTacToeModel(size: 3)
    }
    
    @Published private var model = getNewModel()
    
    var cells: [[TicTacToeModel.Cell]] {
        model.cells
    }
    
    var size: Int {
        model.size
    }
    
    var winner: Int {
        return model.winner
    }
    
    var statusText: String {
        if model.winner == 0 {
            if model.turn {
                return "X turn"
            }
            else {
                return "0 turn"
            }
        }
        else if model.winner == 1 {
            return "X won"
        }
        else {
            return "0 won"
        }
    }
    
    func makeMove(cell: TicTacToeModel.Cell) -> Bool {
        return model.makeMove(i: cell.i, j: cell.j)
    }
    
    func new() {
        model = TicTacToeVM.getNewModel()
    }
    
}
