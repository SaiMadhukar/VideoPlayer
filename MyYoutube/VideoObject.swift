//
//  VideoObject.swift
//  MyYoutube
//
//  Created by Sai Madhukar on 08/07/17.
//  Copyright © 2017 Sai Madhukar. All rights reserved.
//

import UIKit

class VideoPlayerObject : NSObject {

    override init() {
        super.init()
        
        performOperations()
    }
    
    let video = VideoView()
    
    
    
    func performOperations() {
        
        if let keyWindow = UIApplication.shared.keyWindow  {
            
            
            video.backgroundColor = .clear
            video.frame = keyWindow.bounds
            keyWindow.addSubview(video)
            
        }

    }
    
    func remove()
    {
        
        
        
        
        
    }
    
    
}
