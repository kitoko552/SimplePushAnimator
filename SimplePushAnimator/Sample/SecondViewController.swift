//
//  SecondViewController.swift
//  SimplePushAnimator
//
//  Created by Kosuke Kito on 2015/06/22.
//  Copyright (c) 2015年 Kosuke Kito. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    private var transitioner: Transitioner?
    
    class func instantiate() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let viewController = storyboard.instantiateViewControllerWithIdentifier("Second") as! SecondViewController
        viewController.transitioner = Transitioner(style: .SimplePush, viewController: viewController)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SecondViewController {
    @IBAction func buttonTapped(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}