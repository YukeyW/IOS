//
//  ViewController.swift
//  Concentration
//
//  Created by yukey on 10/5/20.
//  Copyright © 2020 Yukey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2 )
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
//    private var emojiChoice = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    private var emojiChoice = "🦇😱🙀😈🎃👻🍭🍬🍎"
    
    private var emoji = [Card:String]()
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    private func updateViewFromModel() {
        for (index, button) in cardButtons.enumerated() {
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
 
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoice.count > 0 {
            let randomIndex = emojiChoice.index(emojiChoice.startIndex, offsetBy: emojiChoice.count.arc4random)
            emoji[card] = String(emojiChoice.remove(at: randomIndex))
        }
        return emoji[card] ?? "?"
    }
} 

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}


