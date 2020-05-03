//
//  Card.swift
//  Concentration
//
//  Created by Vijay Raja on 4/30/20.
//  Copyright © 2020 Vijay Raja. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identityFactory = 0
    
    static func getUniqueIdentifier()-> Int{
        identityFactory+=1
        return identityFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
