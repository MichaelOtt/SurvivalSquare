//
//  Effect.swift
//  Survival Square
//
//  Created by Michael Ott on 3/15/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import Foundation

class Effect
{
    var scene:GameScene?
    init(scene:GameScene)
    {
        self.scene = scene
    }
    init()
    {
        
    }
    func getScene(scene:GameScene)
    {
        self.scene = scene
    }
    func activate()
    {
        
    }
    func getCooldown() -> Int
    {
        return 500
    }
}