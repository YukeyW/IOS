//
//  ViewController.swift
//  Concentration
//
//  Created by yukey on 10/5/20.
//  Copyright © 2020 Yukey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2 )
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoice = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    
    var emoji = [Int:String]()
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card  was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for (index, button) in  cardButtons.enumerated() {
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.7049061438, blue: 0.1719946488, alpha: 0) : #colorLiteral(red: 1, green: 0.7049061438, blue: 0.1719946488, alpha: 1)
            }
        }
    }
 
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoice.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
            emoji[card.identifier] = emojiChoice.remove(at: randomIndex)
        }
        return  emoji[card.identifier] ?? "?"
    }
}


