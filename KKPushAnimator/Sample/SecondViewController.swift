//
//  SecondViewController.swift
//  RightWrapAnimator
//
//  Created by Kosuke Kito on 2015/06/22.
//  Copyright (c) 2015年 Kosuke Kito. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIViewControllerTransitioningDelegate {
    let kAnimator = KKPushAnimator()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    // MARK: - UIViewControllerTransitioningDelegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        kAnimator.presenting = true
        
        return kAnimator
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        kAnimator.presenting = false
        
        return kAnimator
    }

}
