//
//  GameViewController.swift
//  Survival Square
//
//  Created by Michael Ott on 3/26/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import UIKit

import SpriteKit

// no idea what this does
extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file as String, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}
// not really sure what this does either
class GameViewController: UIViewController {
    
    var abilities = [Effect]()
    var difficulty:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
        var width:CGFloat
        var height:CGFloat
        //if (UIDevice.currentDevice().orientation == .Portrait || UIDevice.currentDevice().orientation == .PortraitUpsideDown)
        //{
            width = view.frame.size.width
            height = view.frame.size.height
        //}
        //else
        //{
            //width = view.frame.size.height
            //height = view.frame.size.width
        //}
        
        let scene = GameScene(size:CGSize(width:width,height:height),vc:self,abilities:abilities,difficulty: difficulty)
        // Configure the view.
        let skView = self.view as! SKView
        //skView.showsFPS = true
        //skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        
    }
    func setCurrentAbilities(abilities: [Effect])
    {
        self.abilities = abilities
    }
    func setDiff(difficulty: Int)
    {
        self.difficulty = difficulty
    }
    func segueToMain()
    {
        self.performSegueWithIdentifier("goHome", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        //let vc = segue.destinationViewController as? ViewController
        //vc?.setLabel("hello")
    }
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            //return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
            return Int(UIInterfaceOrientationMask.LandscapeRight.rawValue)
            //return Int(UIInterfaceOrientationMask.Landscape.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

