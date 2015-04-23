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
    @IBOutlet var selectBtn1:UIButton!
    var currentSelection:Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        updateButtons()
        // Do any additional setup after loading the view.
    }
    func setCurrentAbilities(abilities: [Effect])
    {
        self.abilities = abilities
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func abilitySelectBtn1(sender: UIButton)
    {
        currentSelection = 0
        selectBtn1.highlighted = true;
    }
    
    @IBAction func explosionAbility(sender: UIButton)
    {
        if (currentSelection != -1)
        {
            abilities[currentSelection] = ExplosionEffect()
            selectBtn1.highlighted = false
            currentSelection = -1
        }
        updateButtons()
    }
    @IBAction func triangleShotAbility(sender: UIButton)
    {
        if (currentSelection != -1)
        {
            abilities[currentSelection] = TriangleShotEffect()
            selectBtn1.highlighted = false
            currentSelection = -1
        }
        updateButtons()
    }
    func updateButtons()
    {
        if (abilities[0] is ExplosionEffect)
        {
            selectBtn1.imageView!.image = UIImage(named: "AbilityExplosion")
        }
        else
        {
            selectBtn1.imageView!.image = UIImage(named: "AbilityTriangleShot")
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
