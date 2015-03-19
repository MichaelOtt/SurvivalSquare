//
//  ExplosionObject.swift
//  Survival Square
//
//  Created by Michael Ott on 3/19/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit
class ExplosionObject: EffectObject
{
    init()
    {
        super.init(imageName:"explosion")
        speed = 2
        xScale = 0
        yScale = 0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func update(scene: GameScene)
    {
        tickCounter++
        if (tickCounter < 25)
        {
            xScale += 0.2/25
            yScale += 0.2/25
        }
        else if (tickCounter < 75)
        {
            xScale += 0.05/50
            yScale += 0.05/50
        }
        else if (tickCounter < 105)
        {
            xScale -= 0.25/30
            yScale -= 0.25/30
        }
        else
        {
            removed = true
        }
        destroyDots(scene)
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
            }
        }
    }
}