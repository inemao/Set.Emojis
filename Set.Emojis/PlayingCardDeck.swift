//
//  PlayingCardDeck.swift
//  Set
//
//  Created by beckerresearch on 3/16/19.
//  Copyright © 2019 Washington University. All rights reserved.
//

import Foundation

struct PlayingCardDeck
{
    private(set) var cards = [PlayingCard]()
    
    init() {
        for number in PlayingCard.Number.all{
            for shape in PlayingCard.Shape.all{
                for shading in PlayingCard.Shading.all{
                    for color in PlayingCard.Color.all {
                        cards.append(PlayingCard(number: number, shape: shape, shading: shading, color: color))
                    }
                }
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else{
            return nil
        }
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else{
            return 0
        }
    }
}
