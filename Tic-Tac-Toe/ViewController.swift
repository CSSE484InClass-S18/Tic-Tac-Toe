//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by David Fisher on 3/15/18.
//  Copyright © 2018 David Fisher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var gameBoardButtons: [UIButton]!
  @IBOutlet weak var gameStateLabel: UILabel!
  @IBOutlet weak var gameStateNavBar: UINavigationBar!
  @IBOutlet weak var gameBoardImageView: UIImageView!

  var game = TicTacToeGame()

  override func viewDidLoad() {
    super.viewDidLoad()
    gameStateNavBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 34)]

    if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact) {
      print("Using iPhone board")
      gameBoardImageView.image = #imageLiteral(resourceName: "iPhone_board")
    } else {
      print("Using iPad board")
      gameBoardImageView.image = #imageLiteral(resourceName: "iPad_board")
    }
    updateView()
  }

  @IBAction func pressedNewGame(_ sender: Any) {
    print("You pressed new game!")
    game = TicTacToeGame()
    updateView()
  }

  @IBAction func pressedGameBoardButton(_ sender: Any) {
//    guard let gameBoardButton = sender as? UIButton else {
//      return;
//    }
    let gameBoardButton = sender as! UIButton
    print(gameBoardButton.tag)
    game.pressedSquare(gameBoardButton.tag)
    updateView()
  }

  func updateView() {
    var xImage: UIImage
    var oImage: UIImage
    if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact) {
      gameStateLabel.text = game.gameState.rawValue
      xImage = #imageLiteral(resourceName: "iPhone_X")
      oImage = #imageLiteral(resourceName: "iPhone_O")
    } else {
      gameStateNavBar.topItem?.title = game.gameState.rawValue
      xImage = #imageLiteral(resourceName: "iPad_X")
      oImage = #imageLiteral(resourceName: "iPad_O")
    }

    for i in 0..<9 {
      let button = gameBoardButtons[i]
      switch (game.gameBoard[i]) {
      case .x:
        button.setImage(xImage, for: UIControlState.normal)
      case .o:
        button.setImage(oImage, for: UIControlState.normal)
      case .none:
        button.setImage(nil, for: UIControlState.normal)
      }
    }
  }

}

