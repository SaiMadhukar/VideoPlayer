//
//  Data.swift
//  MyYoutube
//
//  Created by Sai Madhukar on 06/07/17.
//  Copyright © 2017 Sai Madhukar. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase


class Data : NSObject {
    
    var videos : [VideoObject] = []
    
     var videosNames = ["Alan Walker - Fade [NCS Release]","Cartoon - On & On (feat. Daniel Levi) [NCS Release]","Tobu & Itro - Sunburst [NCS Release]","Itro & Tobu - Cloud 9 [NCS Release]","DEAF KEV - Invincible [NCS Release]","Tobu - Hope [NCS Release]","Disfigure - Blank [NCS Release]","Ahrix - Nova [NCS]","Different Heaven & EH!DE - My Heart [NCS Release]"]
    
    init(DRef ref:DatabaseReference) {
        
        ref.child("Admin")
//        ref.observe(DataEventType.value, with: { (snap) in
//
//            let admin = snap.childSnapshot(forPath: "Admin")
//            for index in 0..<Int(admin.childrenCount) {
//                print(admin.childSnapshot(forPath: "\(index)").value!)
//                self.videosNames[index] = (admin.childSnapshot(forPath: "\(index)").value!) as! String
//            }
//
//        })
    
    }
    
    func get() -> [String] {
        return videosNames
    }
    
}

struct VideoObject {
    
    var name : String = ""
    
    var thumbnailImage : UIImage? = nil
    
    var VideoCover: UIImage? = nil
    
    var owner : String = ""
}
