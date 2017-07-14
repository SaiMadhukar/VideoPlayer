//
//  TrendingViewController.swift
//  MyYoutube
//
//  Created by Sai Madhukar on 06/07/17.
//  Copyright © 2017 Sai Madhukar. All rights reserved.
//

import UIKit

class TrendingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let DownSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown))
        DownSwipe.direction = .down
        view.addGestureRecognizer(DownSwipe)
       
        view.backgroundColor = UIColor.black
        // Do any additional setup after loading the view.
    }
    
    func swipeDown()
    {
        print("Hello Do you want a loading wheel right?")
       
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activity.frame = CGRect(x: 0, y: 50, width: view.bounds.width, height: 100)
        view.addSubview(activity)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        activity.color = .white
        activity.startAnimating()
        
               
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
