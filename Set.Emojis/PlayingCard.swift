//
//  PlayingCard.swift
//  Set
//
//  Created by beckerresearch on 3/16/19.
//  Copyright © 2019 Washington University. All rights reserved.
//

import Foundation

struct PlayingCard : Equatable
{
    
    
    static func == (lhs: PlayingCard, rhs: PlayingCard) -> Bool {
        return lhs.number == rhs.number &&
        lhs.shape == rhs.shape &&
        lhs.shading == rhs.shading &&
        lhs.color == rhs.color
        
    }
    
    
    var number: Number
    var shape: Shape
    var shading: Shading
    var color: Color
    
    enum Number: Int, Equatable
    {
        case one = 1
        case two = 2
        case three =  3
        static var all = [Number.one, .two, .three]
    }
    
    enum Shape: Int, Equatable {
        
        case one = 1
        case two = 2
        case three =  3
        static var all = [Shape.one, .two, .three]
        
    }
    
    enum Shading: Int, Equatable {
        case one = 1
        case two = 2
        case three =  3
        static var all = [Shading.one, .two, .three]
    }
    
    enum Color: Int, Equatable {
        case one = 1
        case two = 2
        case three =  3
        static var all = [Color.one, .two, .three]
    }
    
    init(number: Number, shape: Shape, shading: Shading, color: Color){
        self.number = number
        self.shape = shape
        self.shading = shading
        self.color = color
    }

}
