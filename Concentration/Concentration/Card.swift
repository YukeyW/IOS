//
//  Card.swift
//  Concentration
//
//  Created by yukey on 11/5/20.
//  Copyright © 2020 Yukey. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lrs: Card, rhs: Card) -> Bool {
        return lrs.identifier == rhs.identifier
    }
    
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        identifier = Card.getUniqueIdentifier()
    }
}
