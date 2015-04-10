//
//  MenuViewController.swift
//  Survival Square
//
//  Created by Michael Ott on 3/26/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    
    var gameVC: GameViewController
    var currentController: UIViewController?
    required init(coder aDecoder: NSCoder)
    {
        self.gameVC = GameViewController()
        self.currentController = nil
        super.init(coder: aDecoder)
    }
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
    @IBAction func playBtnPressed(sender: UIButton)
    {
        //presentController(gameVC)
    }
    func presentController(controller: UIViewController)
    {
        if (currentController != controller)
        {
            if (currentController != nil)
            {
                currentController!.willMoveToParentViewController(nil)
                currentController!.view.removeFromSuperview()
                currentController!.removeFromParentViewController()
            }
            self.addChildViewController(controller)
            self.view.addSubview(controller.view)
            controller.didMoveToParentViewController(self)
            currentController = controller
        }
    }
}
