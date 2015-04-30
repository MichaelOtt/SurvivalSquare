//
//  TurretObject.swift
//  Survival Square
//
//  Created by Michael Ott on 3/19/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit
class TurretObject: EffectObject
{
    let range = 500
    init()
    {
        super.init(imageName:"turret")
        speed = 0
        xScale = 0.1
        yScale = 0.1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func update(scene: GameScene)
    {
        
    }
    func getClosest(scene: GameScene) -> Enemy?
    {
        var closestDistance:CGFloat = CGFloat(range)
        var closestEnemy:Enemy? = nil
        for (var i = 0; i < scene.enemies.count; i++)
        {
            let d = getDistance(scene.enemies[i])
            if (d < closestDistance)
            {
                closestDistance = d
                closestEnemy = scene.enemies[i]
            }
        }
        return closestEnemy
    }
    func getDistance(enemy: Enemy) -> CGFloat
    {
        let dx = enemy.position.x - self.position.x
        let dy = enemy.position.y - self.position.y
        let d = sqrt(dx*dx+dy*dy)
        return d
    }
}