//
//  CatboardBanner.swift
//  TastyImitationKeyboard
//
//  Created by Alexei Baboulevitch on 10/5/14.
//  Copyright (c) 2014 Apple. All rights reserved.
//

import UIKit

class CatboardBanner: BannerView {
    
    var label: UILabel = UILabel()
    
    var catChangeTimer: NSTimer?
    var marqueeTimer: NSTimer?
    var marqueeOffset: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.label)
        
        self.label.font = UIFont(name: "ChalkboardSE-Regular", size: 22)
        self.updateText()
        self.label.sizeToFit()
        
        self.startCatChangeTimer()
        self.startMarqueeTimer()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.label.center.y = self.center.y
    }
    
    func startCatChangeTimer() {
        self.catChangeTimer?.invalidate()
        self.catChangeTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateText", userInfo: nil, repeats: true)
    }
    
    func startMarqueeTimer() {
        self.marqueeTimer?.invalidate()
        self.marqueeTimer = NSTimer.scheduledTimerWithTimeInterval(1/60.0, target: self, selector: "updateMarquee", userInfo: nil, repeats: true)
    }
    
    func updateText() {
        self.label.text = "\(randomCat()) WELCOME TO CATBOARD \(randomCat()) WELCOME TO CATBOARD \(randomCat()) WELCOME TO CATBOARD \(randomCat())"
    }
    
    func updateMarquee() {
        self.marqueeOffset -= 1
        
        let manualOffset: CGFloat = 295
        if self.marqueeOffset <= -manualOffset {
            self.marqueeOffset += manualOffset
        }
        
        self.label.transform = CGAffineTransformMakeTranslation(self.marqueeOffset, 0)
    }
}