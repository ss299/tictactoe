//
//  ViewController.swift
//  tictactoe
//
//  Created by Saurav Sawansukha on 5/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    var player1: String = "Player 1"
    var player2: String = "Player 2"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextPage(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    @IBAction func Settings(_ sender: Any) {
        performSegue(withIdentifier: "setting", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
                let parser = segue.destination as! GameController
            parser.p1 = player1
            parser.p2 = player2
                
        }
    }
    
}

