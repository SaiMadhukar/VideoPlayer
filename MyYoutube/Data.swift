//
//  Data.swift
//  MyYoutube
//
//  Created by Sai Madhukar on 06/07/17.
//  Copyright © 2017 Sai Madhukar. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage


class Data : NSObject {
    
    var videos : [VideoObject]?
    
     var videosNames = ["Alan Walker - Fade [NCS Release]","Cartoon - On & On (feat. Daniel Levi) [NCS Release]","Tobu & Itro - Sunburst [NCS Release]","Itro & Tobu - Cloud 9 [NCS Release]","DEAF KEV - Invincible [NCS Release]","Tobu - Hope [NCS Release]","Disfigure - Blank [NCS Release]","Ahrix - Nova [NCS]","Different Heaven & EH!DE - My Heart [NCS Release]"]
    
    init(SRef:StorageReference) {
        
        
        
    }
    
    
    
    
    
    
}

struct VideoObject {
    
    var name : String?
    
    var thumbnailImage : UIImage?
    
    var VideoCover: UIImage?
    
    var owner : String?
}
