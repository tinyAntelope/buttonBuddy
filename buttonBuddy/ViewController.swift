//
//  ViewController.swift
//  buttonBuddy
//
//  Created by THE MAYBERS on 3/21/15.
//  Copyright (c) 2015 Tiny Antelope Publishing, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func bigButt(sender: BuddiesButton) {
        sender.isOn = !sender.isOn

    }

}

