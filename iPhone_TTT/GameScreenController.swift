//
//  ViewController.swift
//  iPhone_TTT
//
//  Created by Snee, Connor Patrick on 3/27/17.
//  Copyright © 2017 Snee, Connor Patrick. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

struct winVariables {
    static var computerWins = 0
    static var humanWins = 0 
    static var ties = 0
}

struct winner {
    static var win = 0
}

struct settings {
    static var difficulty: String = "expert"
}

class ViewController: UIViewController {
    
    //Game Variables
    
    var mBoard: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var mBoardArray: [UIImageView] = [];
    let BOARD_SIZE = 9
    
    var playerSound: AVAudioPlayer!
    var player2Sound: AVAudioPlayer!
    
    
    
    
    let HUMAN_PLAYER = "X"
    let COMPUTER_PLAYER = "O"
    var turn = "X"
    var move = -1
    
    @IBOutlet weak var s1: UIImageView!
    
    @IBOutlet weak var s2: UIImageView!
    
    
    @IBOutlet weak var s3: UIImageView!
    
    
    @IBOutlet weak var s4: UIImageView!
    
    
    @IBOutlet weak var s5: UIImageView!
    
    @IBOutlet weak var s6: UIImageView!
    
    
    @IBOutlet weak var s7: UIImageView!
    
    @IBOutlet weak var s8: UIImageView!
    
    @IBOutlet weak var s9: UIImageView!
    
    @IBOutlet weak var infoLbl: UILabel!
    
    
    @IBAction func newGame(_ sender: UIButton) {
        s1.image = nil
        s2.image = nil
        s3.image = nil
        s4.image = nil
        s5.image = nil
        s6.image = nil
        s7.image = nil
        s8.image = nil
        s9.image = nil
        
        mBoard = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        infoLbl.text = "Human's Turn"
        
        winner.win = 0
        
        turn = HUMAN_PLAYER
        
    }
    
    @IBAction func openSettings(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Game Settings", message: "Change Difficulty", preferredStyle: .actionSheet)
        
        let easyAction = UIAlertAction(title: "Easy", style: .default, handler: {(alert: UIAlertAction!) in settings.difficulty = "easy"})
        alertController.addAction(easyAction)
        
        let mediumAction = UIAlertAction(title: "Medium", style: .default, handler:  {(alert: UIAlertAction!) in settings.difficulty = "medium"})
        alertController.addAction(mediumAction)
        
        let hardAction = UIAlertAction(title: "Expert", style: .default, handler:  {(alert: UIAlertAction!) in settings.difficulty = "expert"})
        alertController.addAction(hardAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mBoardArray.append(s1)
        mBoardArray.append(s2)
        mBoardArray.append(s3)
        mBoardArray.append(s4)
        mBoardArray.append(s5)
        mBoardArray.append(s6)
        mBoardArray.append(s7)
        mBoardArray.append(s8)
        mBoardArray.append(s9)
        
        infoLbl.text = "Human's Turn"
        
        //*************************
        
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img1Clicked))
        
        tapGesture1.numberOfTapsRequired = 1
        
        s1.addGestureRecognizer(tapGesture1)
        
        
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img2Clicked))
        
        tapGesture2.numberOfTapsRequired = 1
        
        s2.addGestureRecognizer(tapGesture2)
        
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img3Clicked))
        
        tapGesture3.numberOfTapsRequired = 1
        
        s3.addGestureRecognizer(tapGesture3)
        
        
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img4Clicked))
        
        tapGesture4.numberOfTapsRequired = 1
        
        s4.addGestureRecognizer(tapGesture4)
        
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img5Clicked))
        
        tapGesture5.numberOfTapsRequired = 1
        
        s5.addGestureRecognizer(tapGesture5)
        
        
        
        let tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img6Clicked))
        
        tapGesture6.numberOfTapsRequired = 1
        
        s6.addGestureRecognizer(tapGesture6)
        
        let tapGesture7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img7Clicked))
        
        tapGesture7.numberOfTapsRequired = 1
        
        s7.addGestureRecognizer(tapGesture7)
        
        
        
        let tapGesture8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img8Clicked))
        
        tapGesture8.numberOfTapsRequired = 1
        
        s8.addGestureRecognizer(tapGesture8)
        
        
        let tapGesture9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img9Clicked))
        
        tapGesture9.numberOfTapsRequired = 1
        
        s9.addGestureRecognizer(tapGesture9)
        
        
        
        
    }
    
    
    
    func img1Clicked(){
        imageClick(imgNum: 1)
    }
    
    func img2Clicked(){
       imageClick(imgNum: 2)
    }
    
    func img3Clicked(){
        imageClick(imgNum: 3)
    }
    
    func img4Clicked(){
        imageClick(imgNum: 4)
    }
    
    func img5Clicked(){
        imageClick(imgNum: 5)
    }
    
    func img6Clicked(){
        imageClick(imgNum: 6)
    }
    
    func img7Clicked(){
        imageClick(imgNum: 7)
    }
    
    func img8Clicked(){
        imageClick(imgNum: 8)
    }
    
    
    func img9Clicked(){
        imageClick(imgNum: 9)
    }
    
    func makeRandomMove() {
        var count = 0
        repeat
        {
            count += 1
            move  = Int(arc4random_uniform(9))
            
        } while ((mBoard[move] == HUMAN_PLAYER || mBoard[move] == COMPUTER_PLAYER) && winner.win == 0)
        mBoard[move] = COMPUTER_PLAYER
        
        mBoardArray[move].image = #imageLiteral(resourceName: "o_img.png")
    }
    
    func makeWinnningMove() -> Bool {
        for i in 0 ... BOARD_SIZE-1 {
            if (mBoard[i] != HUMAN_PLAYER && mBoard[i] != COMPUTER_PLAYER) {
                let curr = mBoard[i]
                mBoard[i] = COMPUTER_PLAYER
                checkForWinner()
                if (winner.win == 3) {
                    mBoardArray[i].image = #imageLiteral(resourceName: "o_img.png")
                    return true
                } else{
                    mBoard[i] = curr;
                    winner.win = 0
                }
            }
        }
        return false
    }
    
    func makeBlockingMove() -> Bool {
        for i in 0 ... BOARD_SIZE-1 {
            if (mBoard[i] != HUMAN_PLAYER && mBoard[i] != COMPUTER_PLAYER) {
                let curr = mBoard[i];   // Save the current number
                mBoard[i] = HUMAN_PLAYER
                checkForWinner()
                if (winner.win == 2) {
                    mBoard[i] = COMPUTER_PLAYER;
                    mBoardArray[i].image = #imageLiteral(resourceName: "o_img.png")
                    return true
                } else{
                    mBoard[i] = curr
                    winner.win = 0
                }
            }
        }
        return false
    }
    
    func getComputerMove() {
        if settings.difficulty == "easy" {
            makeRandomMove()
        } else if settings.difficulty == "medium" {
            if makeWinnningMove() {
                return
            } else {
                makeRandomMove()
            }
        } else if settings.difficulty == "expert" {
            if makeWinnningMove() {
                return
            } else if makeBlockingMove() {
                return
            } else {
                makeRandomMove()
            }
        }
    }
    
    // Check for a winner.  Return
    //  0 if no winner or tie yet
    //  1 if it's a tie
    //  2 if X won
    //  3 if O won
    func checkForWinner()
    {
        //check for horizontal wins
        for i in stride(from: 0, to: 7, by: 3) {
            if mBoard[i] == HUMAN_PLAYER && mBoard[i+1] == HUMAN_PLAYER && mBoard[i+2] == HUMAN_PLAYER {
                winner.win = 2
                return
            }
            if mBoard[i] == COMPUTER_PLAYER && mBoard[i+1] == COMPUTER_PLAYER && mBoard[i+2] == COMPUTER_PLAYER {
                winner.win = 3
                return
            }
        }
        
        //check for vertical wins
        for i in stride(from: 0, to: 3, by: 1) {
            if mBoard[i] == HUMAN_PLAYER && mBoard[i+3] == HUMAN_PLAYER && mBoard[i+6] == HUMAN_PLAYER {
                winner.win = 2
                return
            }
            if mBoard[i] == COMPUTER_PLAYER && mBoard[i+3] == COMPUTER_PLAYER && mBoard[i+6] == COMPUTER_PLAYER {
                winner.win = 3
                return
            }
        }
        
        //check for diagonal wins
        if (mBoard[0] == HUMAN_PLAYER && mBoard[4] == HUMAN_PLAYER && mBoard[8] == HUMAN_PLAYER) || (mBoard[2] == HUMAN_PLAYER && mBoard[4] == HUMAN_PLAYER && mBoard[6] == HUMAN_PLAYER) {
            winner.win = 2
            return
        }
        if (mBoard[0] == COMPUTER_PLAYER && mBoard[4] == COMPUTER_PLAYER && mBoard[8] == COMPUTER_PLAYER) || (mBoard[2] == COMPUTER_PLAYER && mBoard[4] == COMPUTER_PLAYER && mBoard[6] == COMPUTER_PLAYER) {
            winner.win = 3
            return
        }
        
        //check for tie
        for i in stride(from: 0, to: BOARD_SIZE, by: 1) {
            if mBoard[i] != HUMAN_PLAYER && mBoard[i] != COMPUTER_PLAYER {
                winner.win = 0
                return
            }
        }
        winner.win = 1
    }
    
    func displayBoard() -> Void {
        print("")
        print("\(mBoard[0]) | \(mBoard[1]) | \(mBoard[2])")
        print("-----------")
        print("\(mBoard[3]) | \(mBoard[4]) | \(mBoard[5])")
        print("-----------")
        print("\(mBoard[6]) | \(mBoard[7]) | \(mBoard[8])")
        print("")
    }
    
    func playPlayerSound() -> Void {
        let audioPath1 = Bundle.main.path(forResource: "swish.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: audioPath1)
        do {
            let p1Sound = try AVAudioPlayer(contentsOf: url)
            playerSound = p1Sound
            p1Sound.play()
        } catch {
            // couldn't load file
        }
    }
    
    func playComputerSound() -> Void {
        let audioPath2 = Bundle.main.path(forResource: "sword.mp3", ofType: nil)!
        let url2 = URL(fileURLWithPath: audioPath2)
        do {
            let p2Sound = try AVAudioPlayer(contentsOf: url2)
            player2Sound = p2Sound
            p2Sound.play()
        } catch {
            // couldn't load file
        }
    }
    
    //Change the view and board based on the image clicked
    func imageClick(imgNum: Int) -> Void {
        let positionNum = imgNum - 1
        if (winner.win == 0 && mBoard[positionNum] == "\(imgNum )" && turn == HUMAN_PLAYER) {
            turn = COMPUTER_PLAYER
            switch imgNum {
            case 1:
                s1.image = #imageLiteral(resourceName: "x_img.png")
            case 2:
                s2.image = #imageLiteral(resourceName: "x_img.png")
            case 3:
                s3.image = #imageLiteral(resourceName: "x_img.png")
            case 4:
                s4.image = #imageLiteral(resourceName: "x_img.png")
            case 5:
                s5.image = #imageLiteral(resourceName: "x_img.png")
            case 6:
                s6.image = #imageLiteral(resourceName: "x_img.png")
            case 7:
                s7.image = #imageLiteral(resourceName: "x_img.png")
            case 8:
                s8.image = #imageLiteral(resourceName: "x_img.png")
            case 9:
                s9.image = #imageLiteral(resourceName: "x_img.png")
            default:
                break
            }
            playPlayerSound()
            infoLbl.text = "Computer's Turn"
            mBoard[positionNum] = HUMAN_PLAYER
            displayBoard()
            checkForWinner()
            if(winner.win == 2) {
                self.infoLbl.text = "Human Wins !!!"
                winVariables.humanWins = winVariables.humanWins + 1
            } else if(winner.win == 1){
                self.infoLbl.text = "It's a Tie !!!"
                winVariables.ties = winVariables.ties + 1
            } else {
                let when = DispatchTime.now() + 2
                DispatchQueue.main.asyncAfter(deadline: when) {
                    self.getComputerMove()
                    self.playComputerSound()
                    self.displayBoard()
                    self.checkForWinner()
                    self.checkForWinner()
                    if(winner.win == 3){
                        self.infoLbl.text = "Computer Wins !!!"
                        winVariables.computerWins = winVariables.computerWins + 1
                    } else {
                        self.turn = self.HUMAN_PLAYER
                        self.infoLbl.text = "Human's Turn"
                    }
                }
            
            }
        }
    }
    
}

