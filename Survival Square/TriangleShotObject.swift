//
//  TriangleShotObject.swift
//  Survival Square
//
//  Created by Michael Ott on 3/19/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit
class TriangleShotObject: EffectObject
{
    init()
    {
        super.init(imageName:"triangleShot")
        speed = 10
        xScale = 0.1
        yScale = 0.1
    }
    init(scale: CGFloat, rotation: CGFloat)
    {
        super.init(imageName:"triangleShot")
        speed = 10
        xScale = scale
        yScale = scale
        zRotation = rotation
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func update(scene: GameScene)
    {
        let tempRotation = zRotation+CGFloat(M_PI/2.0)
        position = CGPointMake(cos(tempRotation)*speed + position.x,sin(tempRotation)*speed+position.y)
        checkBounds(scene)
        destroyDots(scene)
    }
    func checkBounds(scene:GameScene)
    {
        if (position.x < 0)
        {
            removed = true
        }
        if (position.x > scene.size.width)
        {
            removed = true
        }
        if (position.y < 0)
        {
            removed = true
        }
        if (position.y > scene.size.height)
        {
            removed = true
        }
    }
    func destroyDots(scene:GameScene)
    {
        let radius = self.frame.width/2
        for (var i = 0; i < scene.enemies.count; i++)
        {
            let dx = self.position.x - scene.enemies[i].position.x
            let dy = self.position.y - scene.enemies[i].position.y
            let smallRadius = scene.enemies[i].frame.width/2
            if (dx*dx + dy*dy <= (radius+smallRadius)*(radius+smallRadius))
            {
                scene.enemies[i].removeFromParent()
                scene.enemies.removeAtIndex(i)
                i--
                scene.score++
                scene.scoreLbl.text = "\(scene.score)"
            }
        }
    }
}