//
//  ViewController.swift
//  CIBCMars
//
//  Created by Elvina Tse on 2015-11-19.
//  Copyright © 2015 Elvina Tse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var moveButton: UIButton!
    
    @IBAction func myButton(sender: AnyObject) {
        self.myLabel.text = "Something"
        self.myLabel.textColor = UIColor.redColor()
        print("Button was pressed")
    }
    
    @IBAction func moveButton(sender: AnyObject) {
        
        // Do precheck
    performSegueWithIdentifier("showNewView", sender: self)
    }
    
    override func viewWillAppear(animated: Bool) {
        // Happens before the view loads, so do background processes etc. before main view happens
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

