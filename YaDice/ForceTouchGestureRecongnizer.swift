//
//  forceTouchGestureRecongnizer.swift
//  YaDice
//
//  Created by Qiankang Zhou on 7/27/17.
//  Copyright © 2017 Qiankang Zhou. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

class ForceTouchGestureRecognizer: UIGestureRecognizer {
    
    let threshold: CGFloat
    private var forceTouch: Bool = false
    
    init(target: AnyObject?, action: Selector, threshold: CGFloat) {
        self.threshold = threshold
        super.init(target: target, action: action)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with: UIEvent)
    {
        if let touch = touches.first
        {
            handleTouch(touch: touch)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with: UIEvent)
    {
        if let touch = touches.first
        {
            handleTouch(touch: touch)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with: UIEvent)
    {
        super.touchesEnded(touches, with: with)
        
        state = self.forceTouch ? UIGestureRecognizerState.ended : UIGestureRecognizerState.failed
        
        self.forceTouch = false
    }
    
    private func handleTouch(touch: UITouch)
    {
        guard touch.force != 0 && touch.maximumPossibleForce != 0 else
        {
            return
        }
        
        if !self.forceTouch && (touch.force / touch.maximumPossibleForce) >= self.threshold
        {
            state = UIGestureRecognizerState.began
            
            self.forceTouch = true
        }
        else if self.forceTouch && (touch.force / touch.maximumPossibleForce) < self.threshold
        {
            state = UIGestureRecognizerState.ended
            
            self.forceTouch = false
        }
    }
}
