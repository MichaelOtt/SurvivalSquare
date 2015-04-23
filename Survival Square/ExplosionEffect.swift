//
//  ExplosionEffect.swift
//  Survival Square
//
//  Created by Michael Ott on 3/19/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit

class ExplosionEffect:Effect
{
    override func activate()
    {
        let explosion = ExplosionObject()
        explosion.position = scene!.player.position
        scene!.effectObjects.append(explosion)
        scene!.addChild(explosion)
    }
}