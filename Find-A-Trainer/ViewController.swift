//
//  ViewController.swift
//  Find-A-Trainer
//
//  Created by Panafold on 11/13/14.
//  Copyright (c) 2014 Panafold. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("hi")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func findLocalTrainers(sender : AnyObject) {
        let alertController = UIAlertController(title: "Trainee Sign up", message:
            "Get ready to find premier trainers", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

