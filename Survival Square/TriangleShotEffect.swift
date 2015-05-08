//
//  TriangleShotEffect.swift
//  Survival Square
//
//  Created by Michael Ott on 3/19/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit

class TriangleShotEffect:Effect
{
    override func activate()
    {
        let triangleShot = TriangleShotObject(scale:0.1,rotation:scene!.player.zRotation)
        triangleShot.position = scene!.player.position
        scene!.effectObjects.append(triangleShot)
        scene!.addChild(triangleShot)
    }
    override func getCooldown() -> Int
    {
        return 100
    }
}