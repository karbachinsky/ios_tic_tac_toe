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
    
    var size: Int
    var turn = true // true – player #1, false – player #2
    var winner = 0 // 0 – nobody, 1 – X won, Y –  0 won
    
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
    
    mutating func makeMove(i: Int, j: Int) -> Bool {
        if cells[i][j].value != 0 {
            return false
        }
        if (winner != 0) {
            return false
        }
        if turn {
            cells[i][j].value = 1
        }
        else {
            cells[i][j].value = -1
        }
        winner = checkWinner()
        turn.toggle()
        print("GGOGOG \(cells)")
        return false
    }
    
    func checkWinner() -> Int {
        func _check(_ sum: Int) -> Int {
            if sum == -size {return -1}
            if sum == size {return 1}
            return 0
        }
        for i in 0..<size {
            var rowSum = 0
            var columnSum = 0
            var mainDiagsum = 0
            var sideDiagsum = 0
            for j in 0..<size {
                rowSum += cells[i][j].value
                columnSum += cells[j][i].value
                if i == j {
                    mainDiagsum += cells[i][i].value
                    sideDiagsum += cells[i][size - i - 1].value
                }
            }
            
            for sum in [rowSum, columnSum, mainDiagsum, sideDiagsum] {
                let res = _check(sum)
                if res != 0 {
                    return res
                }
            }
        }
        return 0
    }
}
