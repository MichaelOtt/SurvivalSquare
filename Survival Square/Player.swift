//
//  Player.swift
//  Survival Square
//
//  Created by Michael Ott on 3/12/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode
{
    var previous:CGPoint = CGPoint(x:0,y:0)
    override init()
    {
        let texture = SKTexture(imageNamed: "greenDot")
        super.init(texture: texture, color: nil, size: texture.size())
        speed = 2
        xScale = 0.035
        yScale = 0.035
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func changePosition(x:CGFloat,y:CGFloat)
    {
        previous = position
        position = CGPointMake(x,y)
        rotate()
    }
    func rotate()
    {
        let dx:Float = Float(position.x-previous.x)
        let dy:Float = Float(position.y-previous.y)
        zRotation = CGFloat(atan2f(dy,dx))-CGFloat(M_PI/2)
    }
    
}