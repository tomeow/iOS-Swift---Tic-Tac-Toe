//
//  ViewController.swift
//  19_tic-tac-toe
//
//  Created by Tomomi Tamura on 6/23/16.
//  Copyright © 2016 Tomomi Tamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // 1 = maru, 2 = batsu
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameActive = true

    
    @IBOutlet var playAgainButton: UIButton!
    
    
    @IBAction func playAgain(sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = 1
        
        gameActive = true
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
        
        for subview in view.subviews {
            if subview.isKindOfClass(UIButton) == true{
                let button = subview as! UIButton
                button.setImage(nil, forState:UIControlState.Normal)
            }

        }
//        for var i = 0; i < 9; i++ {
//            print(i)
//            let subview = view.viewWithTag(i)
//            if subview?.isKindOfClass(UIButton) == true{
//                let button = subview as! UIButton
//                button.setImage(nil, forState:UIControlState.Normal)
//            }else{
//                print(subview!)
//
//                print("Tag \(i) is not configured right")
//            }
//            
//        }

    }
    
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "maru.png"), forState: .Normal)
                
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage(named: "batsu.png"), forState: .Normal)
                
                activePlayer = 1
                
            }
            
            for combination in winningCombinations {
                
                
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        gameOverLabel.text = "Marus have won!"
                        
                    } else {
                        
                        gameOverLabel.text = "Batsus have won!"
                        
                    }
                    
                    endGame()
                }
                
            }
            
            if gameActive == true {
                
                gameActive = false
                
                for buttonState in gameState {
                    
                    if buttonState == 0 {
                        
                        gameActive = true
                        
                    }
                    
                }
                
                if gameActive == false {
                    
                    gameOverLabel.text = "It's a draw!"
                    
                    endGame()
                    
                }
                
            }
        }
        
    }
    
    func endGame() {
        
        gameOverLabel.hidden = false
        playAgainButton.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
            
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
            
        })

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

