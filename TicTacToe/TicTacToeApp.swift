//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Igor on 02.11.2021.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    var body: some Scene {
        let game = TicTacToeVM()
        
        WindowGroup {
            ContentView(game: game)
        }
    }
}
