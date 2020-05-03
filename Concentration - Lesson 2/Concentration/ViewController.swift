//
//  ViewController.swift
//  Concentration
//
//  Created by Vijay Raja on 4/29/20.
//  Copyright © 2020 Vijay Raja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)

    var flipCount = 0{
        didSet{
            flipLabelCount.text = "Flips: \(flipCount)"
        }
    }
    
    
    @IBOutlet weak var flipLabelCount: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
            
        else{
            print("Card not linked")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear: UIColor.red
            }
        }
    }
    var emojiChoices = ["👻","🦞","🎲","👹","🚀","🎸 "]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card)-> String{
        
        if emoji[card.identifier] == nil,emojiChoices.count>0{
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
                    
        
        return emoji[card.identifier] ?? "?"
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
        

}

