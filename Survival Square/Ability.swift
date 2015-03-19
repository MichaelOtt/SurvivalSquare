//
//  Ability.swift
//  Survival Square
//
//  Created by Michael Ott on 3/15/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation
import SpriteKit
class Ability: SKSpriteNode
{
    let effect:Effect
    init(effect:Effect, imageName:String)
    {
        self.effect = effect
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: nil, size: texture.size())
        speed = 2
        xScale = 0.1
        yScale = 0.1
        userInteractionEnabled = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
    {
        effect.activate()
    }
}