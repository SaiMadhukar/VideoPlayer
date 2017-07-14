//
//  VideoView.swift
//  MyYoutube
//
//  Created by Sai Madhukar on 08/07/17.
//  Copyright © 2017 Sai Madhukar. All rights reserved.
//

import UIKit

class VideoView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setupViews()
    {
        
        let restView = UIView()
        restView.backgroundColor = UIColor.white
        
        addSubview(restView)
        backgroundColor = UIColor(white: 0, alpha: 0.5)
        addVisualConstarints(format: "H:|[v0]|", views: restView)
        let top = UIScreen.main.bounds.height * (9/16)
        print(top)
        addVisualConstarints(format: "V:|-\(top)-[v0]|", views: restView)
    
    
    
    }

}
