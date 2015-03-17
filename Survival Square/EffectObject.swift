//
//  EffectObject.swift
//  Survival Square
//
//  Created by Michael Ott on 3/15/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit
class EffectObject: SKSpriteNode
{
    override init()
    {
        let texture = SKTexture(imageNamed: "EffectImage")
        super.init(texture: texture, color: nil, size: texture.size())
        speed = 2
        xScale = 0.1
        yScale = 0.1
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func update(scene:GameScene)
    {
        
    }
}
