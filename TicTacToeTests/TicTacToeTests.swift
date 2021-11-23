//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Igor on 02.11.2021.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModelMove() throws {
        var model = TicTacToeModel(size: 3)
        var res = model.makeMove(0,0) // X
        
        XCTAssert(model.turn == false)
        // same cell
        XCTAssert(model.makeMove(0,0) == false)
        
        res = model.makeMove(1,0) // 0
        
        XCTAssert(model.turn == true)
        
        res = model.makeMove(1,1) // X
        res = model.makeMove(2,0) // 0
        res = model.makeMove(2,2) // X
        
        
        XCTAssert(model.state == .Xwin, model.state.rawValue)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


}
