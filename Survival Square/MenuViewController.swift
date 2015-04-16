//
//  MenuViewController.swift
//  Survival Square
//
//  Created by Michael Ott on 3/26/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //let storyboard: UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
        //gameVC = storyboard.instantiateViewControllerWithIdentifier("gameViewController") as GameViewController
        
    }
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            //return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
            return Int(UIInterfaceOrientationMask.Landscape.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }
    @IBAction func goBack(sender:UIStoryboardSegue)
    {
        
    }
    @IBAction func playBtnPressed(sender: UIButton)
    {
        //presentController(gameVC)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier=="showGameView"
        {
            //let vc = segue.destinationViewController as? GameViewController
            //vc?.setLabel("hello")
            //let messages = ["yay","nay"]
            
            //vc?.setMessagesArray(messages)
        }
    }
}
