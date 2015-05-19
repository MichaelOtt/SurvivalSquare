//
//  SelectionViewController.swift
//  Survival Square
//
//  Created by Michael Ott on 4/23/15.
//  Copyright (c) 2015 Michael Ott. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    var abilities = [Effect]()
    var buttons = [UIButton]()
    var functions = [Void]()
    //@IBOutlet var selectBtn1:UIButton!
    var currentSelection:Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        createButtons()
        updateButtons()
        // Do any additional setup after loading the view.
    }
    func setCurrentAbilities(abilities: [Effect])
    {
        self.abilities = abilities
    }
    func createButtons()
    {
        for (var i = 0; i < abilities.count; i++)
        {
            let image = UIImage(named: getImageName(abilities[i]))
            let button = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
            button.frame = CGRectMake(CGFloat(20+i*95),self.view.frame.height - 95,CGFloat(75),CGFloat(75))
            button.setImage(image, forState: .Normal)
            button.addTarget(self,action:"buttonAction:",forControlEvents:.TouchUpInside)
            buttons.append(button)
            self.view.addSubview(button)
        }
    }
    func buttonAction(sender:UIButton!)
    {
        for (var i = 0; i < buttons.count; i++)
        {
            if (buttons[i] == sender)
            {
                currentSelection = i
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*@IBAction func abilitySelectBtn1(sender: UIButton)
    {
        currentSelection = 0
        //selectBtn1.highlighted = true
    }*/
    @IBAction func explosionAbility(sender: UIButton)
    {
        if (currentSelection != -1)
        {
            abilities[currentSelection] = ExplosionEffect()
            currentSelection = -1
        }
        updateButtons()
    }
    @IBAction func triangleShotAbility(sender: UIButton)
    {
        if (currentSelection != -1)
        {
            abilities[currentSelection] = TriangleShotEffect()
            currentSelection = -1
        }
        updateButtons()
    }
    @IBAction func turretAbility(sender: UIButton)
    {
        if (currentSelection != -1)
        {
            abilities[currentSelection] = TurretEffect()
            currentSelection = -1
        }
        updateButtons()
    }
    @IBAction func shockWaveAbility(sender: UIButton)
    {
        if (currentSelection != -1)
        {
            abilities[currentSelection] = ShockWaveEffect()
            currentSelection = -1
        }
        updateButtons()
    }
    func getImageName(ability: Effect) -> String
    {
        if ability is ExplosionEffect
        {
            return "AbilityExplosion"
        }
        else if ability is TriangleShotEffect
        {
            return "AbilityTriangleShot"
        }
        else if ability is TurretEffect
        {
            return "AbilityTurret"
        }
        else if ability is ShockWaveEffect
        {
            return "AbilityShockWave"
        }
        return "NoEffect"
    }
    func updateButtons()
    {
        for (var i = 0; i < abilities.count; i++)
        {
            buttons[i].setImage(UIImage(named: getImageName(abilities[i])), forState: .Normal)
        }
        /*if (abilities[0] is ExplosionEffect)
        {
            selectBtn1.setImage(UIImage(named: "AbilityExplosion"), forState: .Normal)
        }
        else
        {
            selectBtn1.setImage(UIImage(named: "AbilityTriangleShot"), forState: .Normal)
        }*/
    }
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            //return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
            return Int(UIInterfaceOrientationMask.Landscape.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let vc = segue.destinationViewController as? MenuViewController
        vc?.setCurrentAbilities(abilities)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
