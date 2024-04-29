//
//  ViewController.swift
//  tyictactoe
//
//  Created by Student on 22/04/24.
//

import UIKit

class ViewController: UIViewController {
var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
     let winningCombination = [[0,1,2], [3,4,5],[6,7,8], [0,3,6], [1,4,7], [2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    
    
    let multiply_imageConfiguration = UIImage.SymbolConfiguration(pointSize : 17, weight: .medium , scale : .large)
    var multiplyImage = UIImage()
    
    let circle_imageConfiguration = UIImage.SymbolConfiguration(pointSize : 17, weight: .medium , scale : .large)
    var circleImage = UIImage()
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var firstButton:  UIButton!
    @IBOutlet weak var secondButton:  UIButton!
    @IBOutlet weak var thirdButton:  UIButton!
    @IBOutlet weak var fourthButton:  UIButton!
    @IBOutlet weak var fiveButton:  UIButton!
    @IBOutlet weak var sixButton:  UIButton!
    @IBOutlet weak var sevenButton:  UIButton!
    @IBOutlet weak var eightButton:  UIButton!
    @IBOutlet weak var nineButton:  UIButton!
    
    
    
    
    @IBAction func Buttonss(_ sender: UIButton)
    {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                sender.setImage(multiplyImage, for: .normal)
                activePlayer = 2
            }
            else {
                sender.setImage(circleImage, for: .normal)
                activePlayer = 1
            }
        }
        
        for combination in winningCombination
        {
            if gameState[combination[0]] != 0 &&
                gameState[combination[0]] ==  gameState[combination[1]] &&
                gameState[combination[1]] ==  gameState[combination[2]]
            {
                gameIsActive = false
                if gameState[combination[0]] == 1
                {
                    label.text = "cross has won!"
                }
                else {
                    label.text =  "nought has won!"
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
            }
        }
         gameIsActive = false
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
                
            }
        }
        if  gameIsActive == false
        {
            label.text = "it was draw "
            label.isHidden = false
            playAgainButton.isHidden  = false
           
        }
        
        
        
    }
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: UIButton) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        playAgainButton.isHidden = false
        label.isHidden = true
        
        
        firstButton.setImage(UIImage(), for:.normal)
       secondButton.setImage(UIImage(), for:.normal)
        thirdButton.setImage(UIImage(), for:.normal)
       fourthButton.setImage(UIImage(), for:.normal)
      fiveButton.setImage(UIImage(), for:.normal)
        sixButton.setImage(UIImage(), for:.normal)
       sevenButton.setImage(UIImage(), for:.normal)
       eightButton.setImage(UIImage(), for:.normal)
        nineButton.setImage(UIImage(), for:.normal)
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        multiplyImage = UIImage.init(systemName:  "multiply",withConfiguration:multiply_imageConfiguration) ?? UIImage()
        circleImage = UIImage.init(systemName:  "circle",withConfiguration: circle_imageConfiguration) ?? UIImage()
        // Do any additional setup after loading the view.
    }


}

