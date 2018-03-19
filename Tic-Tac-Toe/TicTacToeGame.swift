//
//  TicTacToeGame.swift
//  Tic-Tac-Toe
//
//  Created by David Fisher on 3/19/18.
//  Copyright © 2018 David Fisher. All rights reserved.
//

class TicTacToeGame: CustomStringConvertible {
  enum GameState: String {
    case xTurn = "X's Turn"
    case oTurn = "O's Turn"
    case xWon = "X Wins!"
    case oWon = "O Wins!"
    case tie = "Tie Game"
  }
  enum MarkType: String {
    case x = "X"
    case o = "O"
    case none = "-"
  }

  var gameState: GameState
  var gameBoard: [MarkType]

  init() {
    gameState = .xTurn
    gameBoard = [MarkType](repeating: .none, count: 9)
  }

  func getGameString(_ indices: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8]) -> String {
    var gameString = ""
    for index in indices {
      gameString += gameBoard[index].rawValue
    }
    return gameString
  }

  func pressedSquare(_ index: Int) {
    if gameBoard[index] != .none {
      return // This square is not empty
    }
    if gameState == .xTurn {
      gameBoard[index] = .x
      gameState = .oTurn
      checkForGameOver()
    } else if gameState == .oTurn {
      gameBoard[index] = .o
      gameState = .xTurn
      checkForGameOver()
    }
  }

  func checkForGameOver() {
    if !gameBoard.contains(.none) {
      gameState = .tie
    }

    var linesOf3 = [String]()
    linesOf3.append(getGameString([0, 1, 2]))
    linesOf3.append(getGameString([3, 4, 5]))
    linesOf3.append(getGameString([6, 7, 8]))
    linesOf3.append(getGameString([0, 3, 6]))
    linesOf3.append(getGameString([1, 4, 7]))
    linesOf3.append(getGameString([2, 5, 8]))
    linesOf3.append(getGameString([0, 4, 8]))
    linesOf3.append(getGameString([2, 4, 6]))
    for lineOf3 in linesOf3 {
      if lineOf3 == "XXX" {
        gameState = .xWon
      } else if lineOf3 == "OOO" {
        gameState = .oWon
      }
    }
  }

  var description: String {
    return "\(gameState.rawValue)  Board: \(getGameString())"
  }
}
