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
        xScale = 0.07
        yScale = 0.07
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func update(scene: GameScene)
    {
        tickCounter++
        var closestEnemy = getClosest(scene)
        if (closestEnemy != nil)
        {
            var dx:Float = Float(closestEnemy!.position.x - self.position.x)
            var dy:Float = Float(closestEnemy!.position.y - self.position.y)
            self.zRotation = CGFloat(atan2f(dy,dx))
            if (tickCounter % 100 == 0)
            {
                let triangleShot = TriangleShotObject(scale:0.05,rotation:self.zRotation-CGFloat(M_PI/2.0))
                triangleShot.position = self.position
                scene.effectObjects.append(triangleShot)
                scene.addChild(triangleShot)
            }
        }
        if (tickCounter >= 700)
        {
            removed = true
        }
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