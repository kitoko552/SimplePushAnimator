//
//  Transitioner.swift
//  SimplePushAnimator
//
//  Created by 木藤紘介 on 2016/02/20.
//  Copyright © 2016年 木藤 紘介. All rights reserved.
//

import UIKit

enum TransitionStyle {
    case SimplePush, Default
    
    var presentTransitioning: UIViewControllerAnimatedTransitioning? {
        switch self {
        case .SimplePush: return SimplePushAnimator()
        case .Default: return nil
        }
    }
    
    var dismissTransitioning: UIViewControllerAnimatedTransitioning? {
        switch self {
        case .SimplePush: return SimplePopAnimator()
        case .Default: return nil
        }
    }
}

class Transitioner: NSObject {
    private let style: TransitionStyle
    
    init(style: TransitionStyle, viewController: UIViewController) {
        self.style = style
        super.init()
        viewController.transitioningDelegate = self
    }
}

extension Transitioner: UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return style.presentTransitioning
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return style.dismissTransitioning
    }
}