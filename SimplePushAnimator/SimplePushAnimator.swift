//
//  SimplePushAnimator.swift
//  SimplePushAnimator
//
//  Created by Kosuke Kito on 2015/06/22.
//  Copyright (c) 2015年 Kosuke Kito. All rights reserved.
//

import UIKit

class SimplePushAnimator: NSObject {
    private let duration: NSTimeInterval
    private let distance: CGFloat
    
    init(duration: NSTimeInterval = 0.3, distance: CGFloat = 70) {
        self.duration = duration
        self.distance = distance
    }    
}

extension SimplePushAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
            return
        }
        
        presentTransition(transitionContext, toView: toVC.view, fromView: fromVC.view)
    }
}

extension SimplePushAnimator {
    private func presentTransition(transitionContext: UIViewControllerContextTransitioning, toView: UIView, fromView: UIView) {
        guard let containerView = transitionContext.containerView() else {
            return
        }
        
        containerView.insertSubview(toView, aboveSubview: fromView)
        toView.frame = CGRectOffset(toView.frame, containerView.frame.size.width, 0)
        
        let animationHandler: () -> Void = { _ in
            fromView.frame = CGRectOffset(fromView.frame, -self.distance, 0)
            fromView.alpha = 0.7
            toView.frame = containerView.frame
        }
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.05, options: .CurveEaseInOut, animations: animationHandler) { _ in
            fromView.frame = CGRectOffset(fromView.frame, self.distance, 0)
            transitionContext.completeTransition(true)
        }
    }
}


class SimplePopAnimator: NSObject {
    private let duration: NSTimeInterval
    private let distance: CGFloat
    
    init(duration: NSTimeInterval = 0.3, distance: CGFloat = 70) {
        self.duration = duration
        self.distance = distance
    }
}

extension SimplePopAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        dismissTransition(transitionContext, toView: toVC.view, fromView: fromVC.view)
    }
}

extension SimplePopAnimator {
    private func dismissTransition(transitionContext: UIViewControllerContextTransitioning, toView: UIView, fromView: UIView) {
        guard let containerView = transitionContext.containerView() else {
            return
        }
        
        containerView.insertSubview(toView, belowSubview: fromView)
        toView.frame = CGRectOffset(toView.frame, -distance, 0)
        
        let animationHandler: () -> Void = { _ in
            fromView.frame = CGRectOffset(fromView.frame, containerView.frame.size.width, 0)
            toView.frame = CGRectOffset(toView.frame, self.distance, 0)
            toView.alpha = 1.0
        }
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, options: .CurveEaseInOut, animations: animationHandler) { _ in
            transitionContext.completeTransition(true)
        }
    }
}
