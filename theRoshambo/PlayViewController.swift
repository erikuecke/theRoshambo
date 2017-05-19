//
//  PlayViewController.swift
//  theRoshambo
//
//  Created by Erik Uecke on 5/18/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import UIKit

enum Choice: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
}



class PlayViewController: UIViewController {

    // Generate random number 1-3
    func randomValue() -> Int {
        let randomvalue = arc4random() % 3
        return Int(randomvalue)
    }
    
    // Generate random Choice for computer
    func makeCompChoice() -> Choice {
        let compChoices = ["Rock", "Paper", "Scissors"]
        let randomNumber = randomValue()
        return Choice(rawValue: compChoices[randomNumber])!
    }
  
    
    // Programmatic presenting view controller.
    
    @IBAction func rockPlayed(_ sender: Any) {
        
        let controller: ResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        controller.gamerChoice = Choice.Rock
        controller.compChoice = makeCompChoice()
        
      present(controller, animated: true, completion: nil)
    }
    
    // Segue and code
    
    @IBAction func paperPlayed(_ sender: Any) {
        performSegue(withIdentifier: "paperPlay", sender: self)
        
        
    }
    
    // Segue Only
    
    
    
    
    
    
    
    

}

