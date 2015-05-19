//
//  ForceFieldEffect.swift
//  Survival Square
//
//  Created by Michael Ott on 5/19/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
class ForceFieldEffect:Effect
{
    override func activate()
    {
        let field = ForceFieldObject()
        field.position = scene!.player.position
        scene!.effectObjects.append(field)
        scene!.addChild(field)
    }
    override func getCooldown() -> Int
    {
        return 500
    }
    
}