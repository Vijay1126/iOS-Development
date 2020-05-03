//
//  ViewController.swift
//  Concentration
//
//  Created by Vijay Raja on 4/29/20.
//  Copyright © 2020 Vijay Raja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0{
        didSet{
            flipLabelCount.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["💩","🚀","🎲","💩","🚀","🎲"]
    @IBOutlet weak var flipLabelCount: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
            
        else{
            print("Card not linked")
        }
    }
    
    func flipCard(withEmoji emoji:String, on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor.red
        }
        else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = UIColor.white

        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
        

}

