//
//  SlideDownTransitionAnimator.swift
//  Task.1.ImageGallery
//
//  Created by Natalia Kapusta on 05/04/2017.
//  Copyright © 2017 Natalia Kapusta. All rights reserved.
//

import UIKit

class SlideDownTransitionAnimator:NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate{
    
    let duration = 2.0
    var isPresenting = false
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else {
            return
        }
        
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else {
            return
        }
        
        let container = transitionContext.containerView
        
        let offScreenUp = CGAffineTransform(translationX: container.frame.width, y: 0)
        let offScreenDown = CGAffineTransform(translationX: container.frame.width, y: 0)
        
        if isPresenting{
            toView.transform = offScreenUp
        }
        
        toView.transform = offScreenUp
        
        container.addSubview(fromView)
        container.addSubview(toView)
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: [], animations: {
            if self.isPresenting {
                fromView.transform = offScreenDown
                fromView.alpha = 0.2
                toView.transform = CGAffineTransform.identity
            }
            else {
                fromView.transform = offScreenUp
                fromView.alpha = 0.2
                toView.transform = CGAffineTransform.identity
                toView.alpha = 1.0
        }
        }, completion: {
            finished in transitionContext.completeTransition(true)
        })
    }
}
