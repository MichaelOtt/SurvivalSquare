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
        let triangleShot = TriangleShotObject()
        triangleShot.position = scene!.player.position
        triangleShot.zRotation = scene!.player.zRotation
        scene!.effectObjects.append(triangleShot)
        scene!.addChild(triangleShot)
    }
}