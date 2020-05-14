//
//  Concentration.swift
//  Concentration
//
//  Created by yukey on 11/5/20.
//  Copyright © 2020 Yukey. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var findIndex: Int?
            for (index, card) in cards.enumerated() {
                if card.isFaceUp {
                    if findIndex == nil {
                        findIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return findIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at \(index): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards < 0, "Concentration.init(\(numberOfPairsOfCards): You must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
            
    }

}

