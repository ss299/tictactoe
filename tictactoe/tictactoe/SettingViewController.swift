//
//  SettingViewController.swift
//  tictactoe
//
//  Created by Saurav Sawansukha on 6/1/21.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var player1Name: UITextField!
    @IBOutlet weak var player2Name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backHome(_ sender: Any) {
        performSegue(withIdentifier: "backHome", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backHome" {
                let parser = segue.destination as! ViewController
            parser.player1 = player1Name.text!
            parser.player2 = player2Name.text!
                
        }
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
