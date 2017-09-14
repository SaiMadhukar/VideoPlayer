//
//  ViewController.swift
//  MyYoutube
//
//  Created by Sai Madhukar on 06/07/17.
//  Copyright © 2017 Sai Madhukar. All rights reserved.
//

import UIKit
import FirebaseAuth

class TabBarController: UITabBarController,UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadFirstViewControllerSettings()
        navigationController?.navigationBar.addShadow()
        tabBar.addShadow()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func loadFirstViewControllerSettings()
    {
        navigationItem.title = "Home"
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(uploadNewVideo))
        addButton.tintColor = .white
        self.navigationItem.rightBarButtonItem = addButton
        navigationItem.rightBarButtonItem = addButton
        
        
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
        
        self.navigationItem.rightBarButtonItems = []
        
        switch item.tag {
            
        case 0:
            navigationItem.title = "Home"
            let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(uploadNewVideo))
            addButton.tintColor = .white
            self.navigationItem.rightBarButtonItem = addButton
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
    
    
   
    
    
    
    
    
    @objc func uploadNewVideo()
    {
        print("trying to upload a new video")
        
    }

  
}

