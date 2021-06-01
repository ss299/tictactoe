//
//  GameController.swift
//  tictactoe
//
//  Created by Saurav Sawansukha on 5/27/21.
//

import UIKit

class GameController: UIViewController {

    @IBOutlet weak var currentTurn: UILabel!
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!

    var p1: String = "Player 1"
    var p2: String = "Player 2"
    var playerTurn = 1 //Cross
    var gameBoard = [0,0,0,0,0,0,0,0,0]
    let winningPattern = [[0,1,2], [3,4,5], [6,7,8],
                          [0,3,6], [1,4,7], [2,5,8],
                          [0,4,8], [2,4,6]]
    
    var isWin = false
    var counter = 0
    var currentTurnCounter = 1
    
    @IBAction func action(_ sender: UIButton) {
        
        if(gameBoard[sender.tag - 1] == 0 && isWin == false){
            
            if(currentTurnCounter % 2 == 1){
                currentTurn.text = self.player2Name.text! + "'s turn (O)"
                currentTurnCounter = currentTurnCounter + 1
            } else{
                currentTurn.text = self.player1Name.text! + "'s turn (X)"
                currentTurnCounter = currentTurnCounter + 1

            }
            
            gameBoard[sender.tag - 1] = playerTurn
            
            if(playerTurn == 1){
                sender.setImage(UIImage(named: "crossNew.jpeg"), for: UIControl.State())
                playerTurn = 2
            } else {
                sender.setImage(UIImage(named: "newCircle.png"), for: UIControl.State())
                playerTurn = 1
            }
            
            for pattern in winningPattern{
                if(gameBoard[pattern[0]] != 0 && gameBoard[pattern[0]] == gameBoard[pattern[1]] && gameBoard[pattern[1]] == gameBoard[pattern[2]]){
                    isWin = true
                    var playerNum:String = p1
                    if (gameBoard[pattern[0]] == 1){
                        playerNum = p1
                        //Cross won
                        print("Cross")
                    } else{
                        playerNum = p2
                        //Circle won
                        print("Circle")
                    }
                    
                    let alert = UIAlertController(title: "Game Ended", message:String(playerNum) + " won the game \n Do you want to restart the game?", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: "Default action"), style: .default, handler: { _ in
                        NSLog("The \"Yes\" alert occured.")
                        self.gameBoard = [0,0,0,0,0,0,0,0,0]
                        self.playerTurn = 1 //Cross
                        self.isWin = false
                        self.counter = 0
                        self.player1Name.text = self.p1
                        self.player2Name.text = self.p2
                        self.currentTurn.text = self.player1Name.text! + "'s turn (X)"
                        //self.loadView()
                        for i in 1...9{
                            let button = self.view.viewWithTag(i) as! UIButton
                            button.setImage(nil, for: UIControl.State())
                        }
                        
                    }))
                    
                    alert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: "Default action"), style: .default, handler: { _ in
                        NSLog("The \"Yes\" alert occured.")
                        self.performSegue(withIdentifier: "home", sender: nil)
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
        
        //checks if the gamee is a draw or not
        for check in gameBoard{
            if(check != 0){
                self.counter = self.counter + 1
            }
        }
        
        if(self.counter == 9){
            let alert = UIAlertController(title: "Game Ended", message:" The Game was a Draw \n Do you want to restart the game?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"Yes\" alert occured.")
                self.gameBoard = [0,0,0,0,0,0,0,0,0]
                self.playerTurn = 1 //Cross
                self.isWin = false
                self.counter = 0
                //self.loadView()
                self.player1Name.text = self.p1
                self.player2Name.text = self.p2
                self.currentTurn.text = self.player1Name.text! + "'s turn (O)"

                for i in 1...9{
                    let button = self.view.viewWithTag(i) as! UIButton
                    button.setImage(nil, for: UIControl.State())
                }
            }))
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"Yes\" alert occured.")
                self.performSegue(withIdentifier: "home", sender: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        self.counter = 0
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(p1)
        self.player1Name.text = self.p1
        self.player2Name.text = self.p2
        currentTurn.text = self.player1Name.text! + "'s turn (X)"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
