//
//  TurretEffect.swift
//  Survival Square
//
//  Created by Michael Ott on 3/19/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit

class TurretEffect:Effect
{
    override func activate()
    {
        let turret = TurretObject()
        turret.position = scene!.player.position
        scene!.effectObjects.append(turret)
        scene!.addChild(turret)
    }
    override func getCooldown() -> Int
    {
        return 700
    }
}