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
    var maxSpeed:CGFloat
    init(initialspeed:CGFloat, maxSpeed:CGFloat)
    {
        let texture = SKTexture(imageNamed: "redDot")
        self.maxSpeed = maxSpeed
        super.init(texture: texture, color: nil, size: texture.size())
        speed = initialspeed
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
        if (time > 50)
        {
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
    func checkContact(player:Player)->Bool
    {
        if (time > 50)
        {
            let radius = self.frame.width/2
            let dx = self.position.x - player.position.x
            let dy = self.position.y - player.position.y
            let playerRadius = player.frame.width/2
            if (dx*dx + dy*dy <= (radius+playerRadius)*(radius+playerRadius))
            {
                return true
            }
        }
        return false
    }
}