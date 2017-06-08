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
    case Scissor = "Scissor"
}

class PlayViewController: UIViewController {

    // Generate random Choice for computer
    func makeCompChoice() -> Choice {
        let compChoices = ["Rock", "Paper", "Scissor"]
        let randomNumber = Int(arc4random_uniform(3))
        return Choice(rawValue: compChoices[randomNumber])!
    }
    
    // Programmatic presenting view controller.
    
    @IBAction func rockPlayed(_ sender: UIButton) {

        let controller: ResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        controller.gamerChoice = Choice(rawValue: "Rock")
        controller.compChoice = makeCompChoice()
        
       // Using the UINavigationController programmatically
      self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    // Function to set Gamer and Comp Choice for segues
    
    func setGamerCompChoice(segue: UIStoryboardSegue, gChoice: Choice) {
        let controller = segue.destination as! ResultsViewController
        controller.gamerChoice = gChoice
        controller.compChoice = makeCompChoice()
    }
    
    
    // Segue and code
    
    @IBAction func paperPlayed(_ sender: Any) {
        performSegue(withIdentifier: "paperPlay", sender: self)
        
    }
    
    // Segue Only
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "scissorPlay" {
            setGamerCompChoice(segue: segue, gChoice: .Scissor)
           
        } else if segue.identifier == "paperPlay" {
            setGamerCompChoice(segue: segue, gChoice: .Paper)
        }
    }
    

}

