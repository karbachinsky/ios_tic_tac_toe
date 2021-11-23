//
//  Model.swift
//  TicTacToe
//
//  Created by Igor on 10.11.2021.
//

import Foundation


struct TicTacToeModel {
    struct Cell {
        var value: Int
        var i: Int
        var j: Int
    }
    
    enum State: String {
        case GameContinues
        case Xwin
        case ZeroWin
        case Tie
    }
    
    var size: Int
    var turn = true // true – player #1, false – player #2
    var state = State.GameContinues
    
    private(set) var cells = [[Cell]]()
    
    init(size: Int) {
        for i in 0..<size {
            cells.append([])
            for j in 0..<size {
                cells[i].append(Cell(value: 0, i:i, j:j))
            }
        }
        self.size = size
    }
    
    mutating func makeMove(_ i: Int, _ j: Int) -> Bool {
        if cells[i][j].value != 0 {
            return false
        }
        if (state != .GameContinues) {
            return false
        }
        if turn {
            cells[i][j].value = 1
        }
        else {
            cells[i][j].value = -1
        }
        
        state = updateState()
        
        turn.toggle()
        
        return true
    }
    
    func updateState() -> State {
        var isTie = true
        
        func _check(_ sum: Int) -> State {
            if sum == -size {return .ZeroWin}
            if sum == size {return .Xwin}
            return .GameContinues
        }
        
        var mainDiagsum = 0
        var sideDiagsum = 0
        
        for i in 0..<size {
            var rowSum = 0
            var columnSum = 0
            for j in 0..<size {
                if cells[i][j].value == 0 {
                    isTie = false
                }
                rowSum += cells[i][j].value
                columnSum += cells[j][i].value
                if i == j {
                    mainDiagsum += cells[i][i].value
                    sideDiagsum += cells[i][size - i - 1].value
                }
            }
            
            for sum in [rowSum, columnSum] {
                let _state = _check(sum)
                if _state != .GameContinues {
                    return _state
                }
            }
        }
        
        for sum in [mainDiagsum, sideDiagsum] {
            let _state = _check(sum)
            if _state != .GameContinues {
                return _state
            }
        }
        return isTie ? .Tie : .GameContinues
    }
}
