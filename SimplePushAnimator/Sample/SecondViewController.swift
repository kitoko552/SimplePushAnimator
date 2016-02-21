//
//  SecondViewController.swift
//  SimplePushAnimator
//
//  Created by Kosuke Kito on 2015/06/22.
//  Copyright (c) 2015年 Kosuke Kito. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    private var transition: Transitioner?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transition = Transitioner(style: .SimplePush, viewController: self)
    }
}

extension SecondViewController {
    @IBAction func buttonTapped(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}