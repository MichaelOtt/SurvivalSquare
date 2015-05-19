//
//  ShockWaveObject.swift
//  Survival Square
//
//  Created by Michael Ott on 5/19/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit
class ShockWaveObject: EffectObject
{
    init()
    {
        super.init(imageName:"shockWave")
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
        if (tickCounter < 10)
        {
            xScale += 0.4/10
            yScale += 0.4/10
        }
        else
        {
            removed = true
        }
    }
}
