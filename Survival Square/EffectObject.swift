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
    var tickCounter = 0
    var removed = false
    init(imageName:String)
    {
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: nil, size: texture.size())
        speed = 2
        xScale = 0.1
        yScale = 0.1
        zPosition = 1
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func update(scene:GameScene)
    {
        tickCounter++
    }
}
