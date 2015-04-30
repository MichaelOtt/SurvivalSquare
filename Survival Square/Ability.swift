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
    let cooldown:Int
    var count:Int
    let cooldownrect:SKShapeNode
    init(effect:Effect, imageName:String, cooldown:Int)
    {
        self.effect = effect
        let texture = SKTexture(imageNamed: imageName)
        self.cooldown = cooldown
        self.count = cooldown
        cooldownrect = SKShapeNode()
        super.init(texture: texture, color: nil, size: texture.size())
        speed = 2
        xScale = 0.1
        yScale = 0.1
        userInteractionEnabled = true
        zPosition = 50
    }
    func getCooldown() -> Int
    {
        return 500
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        if (count > cooldown)
        {
            effect.activate()
            count = 0
        }
    }
    func update()
    {
        count++
        if (count < cooldown)
        {
            let coolpercent:CGFloat = (CGFloat(cooldown-count)/CGFloat(cooldown))
            cooldownrect.yScale = coolpercent
        }
        else
        {
            cooldownrect.yScale = 0
        }
    }
    func createCooldownRect(scene:GameScene)
    {
        let rect:CGRect = CGRect(x:0,y:0,width:self.frame.width,height:self.frame.height)
        let color:UIColor = UIColor(red:0.5,green:0.5,blue:0.5,alpha:0.5)
        cooldownrect.position = CGPointMake(self.position.x-self.frame.width/2,self.position.y-self.frame.height/2)
        cooldownrect.path = CGPathCreateWithRect(rect, nil)
        cooldownrect.fillColor = color
        cooldownrect.strokeColor = color
        cooldownrect.zPosition = 100
        scene.addChild(cooldownrect)
    }
}