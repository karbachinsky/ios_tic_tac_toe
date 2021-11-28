//
//  ViewModel.swift
//
//
//  Created by Igor on 10.11.2021.
//

import Foundation

class TicTacToeVM: ObservableObject {
    typealias Cell = TicTacToeModel.Cell
    
    static func getNewModel() -> TicTacToeModel {
        TicTacToeModel(size: 5)
    }
    
    @Published private var model = getNewModel()
    
    var cells: [[Cell]] {
        model.cells
    }
    
    var size: Int {
        model.size
    }
    
    var state: TicTacToeModel.State {
        return model.state
    }
    
    var statusText: String {
        switch model.state {
            case .Xwin:
                return "X won"
            case .ZeroWin:
                return "0 won"
            case .Tie:
                return "Tie"
            case .GameContinues:
                if model.turn {
                    return "X turn"
                }
                else {
                    return "0 turn"
                }
        }
    }
    
    func makeMove(cell: Cell) -> Bool {
        return model.makeMove(cell.i, cell.j)
    }
    
    func new() {
        model = TicTacToeVM.getNewModel()
    }
    
}
