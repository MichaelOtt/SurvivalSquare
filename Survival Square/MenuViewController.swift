//
//  MenuViewController.swift
//  Survival Square
//
//  Created by Michael Ott on 3/26/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var abilities = [Effect]()
    override func viewDidLoad()
    {
        abilities.append(ExplosionEffect())
        abilities.append(TurretEffect())
        abilities.append(TriangleShotEffect())
        super.viewDidLoad()
        //let storyboard: UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
        //gameVC = storyboard.instantiateViewControllerWithIdentifier("gameViewController") as GameViewController
        
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
    func setCurrentAbilities(abilities: [Effect])
    {
        self.abilities = abilities
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
            let vc = segue.destinationViewController as? GameViewController
            vc?.setCurrentAbilities(abilities)
            vc?.setDiff(0)//easy
        }
        if segue.identifier=="showGameView(hard)"
        {
            let vc = segue.destinationViewController as? GameViewController
            vc?.setCurrentAbilities(abilities)
            vc?.setDiff(1)//hard
        }
        if segue.identifier=="showSelectionView"
        {
            let vc = segue.destinationViewController as? SelectionViewController
            vc?.setCurrentAbilities(abilities)
        }
    }
}
