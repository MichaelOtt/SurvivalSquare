//
//  ShockWaveEffect.swift
//  Survival Square
//
//  Created by Michael Ott on 5/19/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit

class ShockWaveEffect:Effect
{
    override func activate()
    {
        let wave = ShockWaveObject()
        wave.position = scene!.player.position
        scene!.effectObjects.append(wave)
        scene!.addChild(wave)
        pushEnemies()
    }
    override func getCooldown() -> Int
    {
        return 500
    }
    func pushEnemies()
    {
        for child:Enemy in scene!.enemies
        {
            child.pushFromPoint(scene!.player.position,power: 300)
        }
    }
}