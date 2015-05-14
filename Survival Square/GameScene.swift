
import SpriteKit
import UIKit
import CoreMotion

class GameScene: SKScene
{
    let player = Player()
    var vc:GameViewController?
    var touches = NSSet()
    var touching = false
    var enemies = [Enemy]()
    var effectObjects = [EffectObject]()
    var abilities = [Ability]()
    var motionManager = CMMotionManager()
    var accelx:Double = 0
    var accely:Double = 0
    var score:Int = 0
    var scoreLbl:UILabel
    var stopped = false
    var selectedAbilities = [Effect]()
    var difficulty:Int = 0
    var spawnrate:Double = 1
    var enemySpeed:CGFloat = 0.5
    var enemySpeedMax:CGFloat = 5
    /*class func scene(size:CGSize)->GameScene
    {
        return GameScene(size:size)
    }*/
    init(size:CGSize,vc:GameViewController,abilities:[Effect],difficulty:Int)
    {
        self.vc = vc
        self.difficulty = difficulty
        if (difficulty == 1)
        {
            spawnrate = 0.5
            enemySpeed = 1.5
            enemySpeedMax = 7
        }
        self.selectedAbilities=abilities
        scoreLbl = UILabel()
        scoreLbl.frame = CGRectMake(10,10,200,21);
        scoreLbl.text = "\(score)"
        super.init(size:size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMoveToView(view: SKView)
    {
        player.position = CGPointMake(self.size.width/2,self.size.height/2)
        self.addChild(player)
        addAbilityButtons(selectedAbilities)
        
        if motionManager.accelerometerAvailable
        {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue())
            {
                (data, error)in
                self.accelx = data.acceleration.x
                self.accely = data.acceleration.y
            }
        }
        self.view!.addSubview(scoreLbl)
    }
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        touching = false
    }
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        self.touches = touches
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
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
    func addAbilityButtons(abilities:[Effect])
    {
        for (var i = 0; i < abilities.count; i++)
        {
            let effect = abilities[i]
            effect.getScene(self)
            var imageName:String
            if (effect is ExplosionEffect)
            {
                imageName = "AbilityExplosion"
            }
            else if(effect is TriangleShotEffect)
            {
                imageName = "AbilityTriangleShot"
            }
            else
            {
                imageName = "AbilityTurret"
            }
            let abilityButton = Ability(effect:effect,imageName:imageName,cooldown:effect.getCooldown())
            abilityButton.position = CGPointMake(self.size.width - (abilityButton.size.width * (1.0+1.5*CGFloat(i))),0 + abilityButton.size.height)
            abilityButton.createCooldownRect(self)
            addChild(abilityButton)
            self.abilities.append(abilityButton)
        }
        /*let effect1 = ExplosionEffect(scene:self)
        let abilityButton1 = Ability(effect:effect1,imageName:"AbilityExplosion",cooldown:500)
        abilityButton1.position = CGPointMake(self.size.width - abilityButton1.size.width,0 + abilityButton1.size.height)
        abilityButton1.createCooldownRect(self)
        addChild(abilityButton1)
        self.abilities.append(abilityButton1)
        
        let effect2 = TriangleShotEffect(scene:self)
        let abilityButton2 = Ability(effect:effect2,imageName:"AbilityTriangleShot",cooldown:500)
        abilityButton2.position = CGPointMake(self.size.width - abilityButton2.size.width*2.5,0 + abilityButton2.size.height)
        abilityButton2.createCooldownRect(self)
        addChild(abilityButton2)
        self.abilities.append(abilityButton2)*/
    }
    func drawRect(rect: CGRect)
    {
        let color:UIColor = UIColor(red:0.5,green:0.5,blue:0.5,alpha:0.3)
        let shapeNode:SKShapeNode = SKShapeNode()
        shapeNode.path = CGPathCreateWithRect(rect, nil)
        shapeNode.fillColor = color
        shapeNode.strokeColor = color
        addChild(shapeNode)
    }
    func moveWithValues(xvalue:CGFloat,yvalue:CGFloat)
    {
        let px = player.position.x
        let py = player.position.y
        player.changePosition(px+player.speed*xvalue,y:py+player.speed*yvalue)
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
    func getDistance(firstPoint:CGPoint, secondPoint:CGPoint)->CGFloat
    {
        let dx = firstPoint.x - secondPoint.x
        let dy = firstPoint.y - secondPoint.y
        return sqrt(dx*dx+dy*dy)
    }
    func createEnemyAtPosition(position:CGPoint)
    {
        let enemySprite = Enemy(initialspeed: enemySpeed,maxSpeed: enemySpeedMax)
        enemySprite.position = position
        enemies.append(enemySprite)
        self.addChild(enemySprite)
    }
    func createEnemy()
    {
        var position:CGPoint
        do
        {
            position = CGPointMake(CGFloat(random()%Int(self.size.width)),CGFloat(random()%Int(self.size.height)))
        }while(getDistance(position,secondPoint: player.position)<50)
        createEnemyAtPosition(position)
    }
    func createEnemyBlock()
    {
        let blockSide:CGFloat = 50.0
        let blockNum = 3
        let widthForRandom = self.size.width-blockSide
        let heightForRandom = self.size.height-blockSide
        let blockChange = blockSide/CGFloat(blockNum-1)
        var centerPosition:CGPoint
        do
        {
            centerPosition = CGPointMake(CGFloat(random()%Int(widthForRandom))+blockSide/2,CGFloat(random()%Int(heightForRandom))+blockSide/2)
        }while(getDistance(centerPosition,secondPoint:player.position)<100)
        let initialx = centerPosition.x - blockSide/2
        let initialy = centerPosition.y - blockSide/2
        for (var r = 0; r < blockNum; r++)
        {
            for (var c = 0; c < blockNum; c++)
            {
                createEnemyAtPosition(CGPointMake(initialx + blockChange * CGFloat(c),initialy + blockChange * CGFloat(r)))
            }
        }
    }
    func createEnemyCircle()
    {
        let radius:CGFloat = 150.0
        let num = 10
        let angleChange:CGFloat = CGFloat(2) * CGFloat(M_PI) / CGFloat(num)
        for (var i = 0; i < num; i++)
        {
            let dx = cos(angleChange*CGFloat(i))*radius
            let dy = sin(angleChange*CGFloat(i))*radius
            let position:CGPoint = CGPointMake(player.position.x + dx, player.position.y + dy)
            if (position.x > 0 && position.x < self.size.width && position.y > 0 && position.y < self.size.height)
            {
                createEnemyAtPosition(position)
            }
        }
    }
    override func update(currentTime: CFTimeInterval)
    {
        if (!stopped)
        {
            //drawRect(CGRectMake(60,170,200,80))
            if motionManager.accelerometerActive
            {
                moveWithValues(CGFloat(-accely),yvalue:CGFloat(accelx))
            }
            else
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
            }
            if (random()%Int(80*spawnrate) == 0)
            {
                createEnemy()
            }
            if (random()%Int(1500*spawnrate) == 0)
            {
                createEnemyBlock()
            }
            if (random()%Int(1500*spawnrate) == 0)
            {
                createEnemyCircle()
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
            for ability:Ability in abilities
            {
                ability.update()
            }
            for child:Enemy in enemies
            {
                child.update(player.position)
                if (child.checkContact(player))
                {
                    stopped = true
                    self.removeAllChildren()
                    self.scoreLbl.removeFromSuperview()
                    //self.motionManager.
                    vc?.segueToMain()
                    vc = nil
                }
            }
        
        /* Called before each frame is rendered */
        }
    }
    
}
