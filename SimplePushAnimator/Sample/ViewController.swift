//
//  ViewController.swift
//  SimplePushAnimator
//
//  Created by Kosuke Kito on 2015/06/22.
//  Copyright (c) 2015年 Kosuke Kito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextTapped(sender: UIButton) {
        let viewController = SecondViewController.instantiate()
        presentViewController(viewController, animated: true, completion: nil)
    }
}

