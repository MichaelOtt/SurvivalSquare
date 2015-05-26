//
//  ForceFieldObject.swift
//  Survival Square
//
//  Created by Michael Ott on 5/19/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit
class ForceFieldObject: EffectObject
{
    init()
    {
        super.init(imageName:"shockWave")
        speed = 2
        xScale = 0.2
        yScale = 0.2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func update(scene: GameScene)
    {
        tickCounter++
        if (tickCounter > 200)
        {
            removed = true
        }
        position = scene.player.position
        pushEnemies(scene)
    }
    func pushEnemies(scene: GameScene)
    {
        let radius = self.frame.width/2
        for (var i = 0; i < scene.enemies.count; i++)
        {
            let dx = self.position.x - scene.enemies[i].position.x
            let dy = self.position.y - scene.enemies[i].position.y
            let smallRadius = scene.enemies[i].frame.width/2
            if (dx*dx + dy*dy <= (radius+smallRadius)*(radius+smallRadius))
            {
                scene.enemies[i].pushFromPoint(scene.player.position,power: 200)
            }
        }
    }
}
