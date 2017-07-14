//
//  ViewController.swift
//  MyYoutube
//
//  Created by Sai Madhukar on 06/07/17.
//  Copyright © 2017 Sai Madhukar. All rights reserved.
//

import UIKit
import FirebaseAuth

class TabBarController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
     
        navigationItem.title = "Home"
        
        navigationController?.navigationBar.addShadow()
        
        tabBar.addShadow()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillLayoutSubviews() {
        var tabFrame = self.tabBar.frame
        // - 40 is editable , the default value is 49 px, below lowers the tabbar and above increases the tab bar size
        tabFrame.size.height = 45
        tabFrame.origin.y = self.view.frame.size.height - 45
        self.tabBar.barTintColor = .white
        self.tabBar.frame = tabFrame
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item.tag {
            
        case 0:
            navigationItem.title = "Home"
            break
            
        case 1:
             navigationItem.title = "Trending"
            break
            
        case 2:
             navigationItem.title = "Subscription"
            break
        
        case 3:
             navigationItem.title = "Library"
            break
            
        default:
            print("Invalid Tag - UITabBar")
        }
    }

  
}

