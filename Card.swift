//
//  Card.swift
//  Concentration
//
//  Created by yukey on 11/5/20.
//  Copyright © 2020 Yukey. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched =  false
    var identifier: Int
    
    static var identifierFactory =  0
    
    static func getUniqueIdentifier() ->  Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        identifier = Card.getUniqueIdentifier()
    }
}
