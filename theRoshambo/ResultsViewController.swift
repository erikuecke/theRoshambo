//
//  ResultsViewController.swift
//  theRoshambo
//
//  Created by Erik Uecke on 5/18/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import UIKit



class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    var gamerChoice: Choice!
    var compChoice: Choice!
    
    
    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showResults()
    }
    
    func showResults()  {
        var imageName: String?
        var labelText: String?
        
        switch (gamerChoice!, compChoice!) {
        case (gamerChoice, compChoice) where gamerChoice == compChoice:
            labelText = "Its a tie!"
            imageName = "itsatie"
        case (.Rock, .Scissor), (.Paper, .Rock), (.Scissor, .Paper):
            labelText = "You Win! \(gamerChoice.rawValue) beats \(compChoice.rawValue)"
            imageName = "\(gamerChoice.rawValue)\(compChoice.rawValue)"
        default:
            labelText = "You Lose! \(compChoice.rawValue) beats \(gamerChoice.rawValue)"
            imageName = "\(compChoice.rawValue)\(gamerChoice.rawValue)"
        }
        
        imageName = imageName?.lowercased()
        print(imageName!)
        resultImage.image = UIImage(named: imageName!)
        resultLabel.text = labelText
    }
}
