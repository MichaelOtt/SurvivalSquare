
import SpriteKit

class GameScene: SKScene
{
    let player = Player(imageNamed:"triangle")
    var touches = NSSet()
    var touching = false
    var enemies = [Enemy]()
    override func didMoveToView(view: SKView)
    {
        player.position = CGPointMake(self.size.width/2,self.size.height/2)
        player.xScale = 0.2
        player.yScale = 0.2
        self.addChild(player)
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
    func moveWithValues(xvalue:CGFloat,yvalue:CGFloat)
    {
        let speed:CGFloat = 10
        let px = player.position.x
        let py = player.position.y
        player.position = CGPointMake(px + speed*xvalue,py + speed*yvalue)
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
        if (random()%50==0)
        {
            let enemySprite = Enemy(imageNamed:"red square")
            enemySprite.xScale = 0.05
            enemySprite.yScale = 0.05
            enemySprite.position = CGPointMake(CGFloat(random()%Int(self.size.width)),CGFloat(random()%Int(self.size.height)))
            enemies.append(enemySprite)
            self.addChild(enemySprite)
        }
        for child:Enemy in enemies
        {
            child.update(player.position)
        }
        /* Called before each frame is rendered */
    }
}
