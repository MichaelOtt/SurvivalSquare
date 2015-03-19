
import SpriteKit

class GameScene: SKScene
{
    let player = Player()
    var touches = NSSet()
    var touching = false
    var enemies = [Enemy]()
    var effectObjects = [EffectObject]()
    class func scene(size:CGSize)->GameScene
    {
        return GameScene(size:size)
    }
    override func didMoveToView(view: SKView)
    {
        player.position = CGPointMake(self.size.width/2,self.size.height/2)
        self.addChild(player)
        addAbilityButtons()
    }
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent)
    {
        touching = false
    }
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent)
    {
        self.touches = touches
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
    {
        /* Called when a touch begins */
        touching = true
        self.touches = touches
            //let sprite = SKSpriteNode(imageNamed:"triangle")
            //sprite.xScale = 0.2
            //sprite.yScale = 0.2
            //sprite.position = location
            
            //let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            //sprite.runAction(SKAction.repeatActionForever(action))
            
            //self.addChild(sprite)
    }
    func addAbilityButtons()
    {
        let effect1 = ExplosionEffect(scene:self)
        let abilityButton1 = Ability(effect:effect1,imageName:"AbilityExplosion")
        abilityButton1.position = CGPointMake(self.size.width - abilityButton1.size.width,0 + abilityButton1.size.height)
        addChild(abilityButton1)
        
        let effect2 = TriangleShotEffect(scene:self)
        let abilityButton2 = Ability(effect:effect2,imageName:"AbilityTriangleShot")
        abilityButton2.position = CGPointMake(self.size.width - abilityButton2.size.width*2.5,0 + abilityButton2.size.height)
        addChild(abilityButton2)
    }
    func moveWithValues(xvalue:CGFloat,yvalue:CGFloat)
    {
        let speed:CGFloat = 10
        let px = player.position.x
        let py = player.position.y
        player.changePosition(px+speed*xvalue,y:py+speed*yvalue)
        checkBounds()
    }
    func checkBounds()
    {
        var xpos:CGFloat = player.position.x
        var ypos:CGFloat = player.position.y
        if (player.position.x < 0)
        {
            xpos = 0
        }
        if (player.position.x > self.size.width)
        {
            xpos = self.size.width
        }
        if (player.position.y < 0)
        {
            ypos = 0
        }
        if (player.position.y > self.size.height)
        {
            ypos = self.size.height
        }
        player.position = CGPointMake(xpos,ypos)
    }
    func createEnemy()
    {
        let enemySprite = Enemy()
        enemySprite.position = CGPointMake(CGFloat(random()%Int(self.size.width)),CGFloat(random()%Int(self.size.height)))
        enemies.append(enemySprite)
        self.addChild(enemySprite)
    }
    override func update(currentTime: CFTimeInterval)
    {
        if (touching)
        {
            for touch: AnyObject in touches
            {
                let location = touch.locationInNode(self)
                let xvalue = (location.x/self.size.width*2-1)
                let yvalue = (location.y/self.size.height*2-1)
                moveWithValues(xvalue,yvalue:yvalue)
            }
        }
        if (random()%50 == 0)
        {
            createEnemy()
        }
        for child:Enemy in enemies
        {
            child.update(player.position)
        }
        for (var i = 0; i < effectObjects.count; i++)
        {
            effectObjects[i].update(self)
            if (effectObjects[i].removed)
            {
                effectObjects[i].removeFromParent()
                effectObjects.removeAtIndex(i)
                i--;
            }
        }
        /* Called before each frame is rendered */
    }
}
