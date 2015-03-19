//
//  Enemy.swift
//  Survival Square
//
//  Created by Michael Ott on 3/8/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit

class Enemy: SKSpriteNode
{
    var time:CGFloat = 0
    let maxSpeed:CGFloat = 7
    override init()
    {
        let texture = SKTexture(imageNamed: "redDot")
        super.init(texture: texture, color: nil, size: texture.size())
        speed = 2
        xScale = 0.025
        yScale = 0.025
        zPosition = 2
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func update(player:CGPoint)
    {
        time++
        moveTowardsPoint(player)
        if (speed < maxSpeed)
        {
            speed += time*0.00001
        }
        else
        {
            speed = maxSpeed
        }
        
    }
    func moveTowardsPoint(point:CGPoint)
    {
        var dx = point.x - self.position.x
        var dy = point.y - self.position.y
        let hyp = sqrt(dx*dx + dy*dy)
        var normalx = dx/hyp
        var normaly = dy/hyp
        self.position = CGPointMake(self.position.x + normalx*speed, self.position.y + normaly*speed)
    }
}