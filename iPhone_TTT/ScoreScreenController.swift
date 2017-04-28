//
//  ScoreScreenController.swift
//  iPhone_TTT
//
//  Created by Snee, Connor Patrick on 4/24/17.
//  Copyright © 2017 Snee, Connor Patrick. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet var computerWinsLabel: UILabel!
    @IBOutlet var humanWinsLabel: UILabel!
    @IBOutlet var tieLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        humanWinsLabel.text = "\(winVariables.humanWins)"
        computerWinsLabel.text = "\(winVariables.computerWins)"
        tieLabel.text = "\(winVariables.ties)"
    }
    
    @IBAction func refreshScores(sender: AnyObject) {
        winVariables.humanWins = 0
        winVariables.computerWins = 0
        winVariables.ties = 0
        humanWinsLabel.text = "\(winVariables.humanWins)"
        computerWinsLabel.text = "\(winVariables.computerWins)"
        tieLabel.text = "\(winVariables.ties)"
    }
}
