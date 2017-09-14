//
//  YoutubeCell.swift
//  Youtube
//
//  Created by sai madhukar on 21/12/16.
//  Copyright © 2016 sai madhukar. All rights reserved.
//

import UIKit

internal class YoutubeVideoCell: UICollectionViewCell {
    
    var ImageView : UIImageView = {
        var iv = UIImageView()
        iv.backgroundColor = UIColor.gray
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addShadow()
        return iv
        
    }()
    
       var sepeartorView : UIView = {
        
        let sv = UIView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        
        return sv
    }()
    
    var userProfileImageView: UIImageView = {
        
        let up = UIImageView()
        up.backgroundColor = UIColor.green
        up.translatesAutoresizingMaskIntoConstraints = false
        up.layer.cornerRadius = 22
        up.layer.masksToBounds = true
        return up
    }()
    
    var Download: UIButton = {
        
        let d = UIButton()
        d.tintColor = .lightGray
        d.clipsToBounds = true
        d.translatesAutoresizingMaskIntoConstraints = false
        return d
    }()
    
    
    var mainLabel: UILabel = {
        
        let ml = UILabel()
        ml.backgroundColor = UIColor.white
        ml.font = UIFont(name: "Avineir-Next", size: 17)
        ml.textColor = UIColor.black
        ml.translatesAutoresizingMaskIntoConstraints = false
        return ml
    }()
    
    var commentLabel: UILabel = {
        
        let cl = UILabel()
        cl.backgroundColor = UIColor.white
        cl.font  = UIFont(name: "HelveticaNeue-Thin", size: 14)
        cl.textColor = UIColor.lightGray
        cl.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        cl.translatesAutoresizingMaskIntoConstraints = false
        return cl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellStructure()
    }
    
    func cellStructure() {
        
        addSubview(ImageView)
        addSubview(sepeartorView)
        addSubview(userProfileImageView)
        addSubview(Download)
        addSubview(mainLabel)
        addSubview(commentLabel)
       
        
        
        //Image View
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : ImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:|-11-[v0]-8-[v1(44)]-16-[v2(1)]|", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : ImageView, "v1":userProfileImageView, "v2":sepeartorView]))
        
        
        //Sepearator View
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : sepeartorView]))
        // addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : sepeartorView]))
        
        //user profile image view
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|-16-[v0(44)]", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : userProfileImageView]))
        // addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:[v0(44)]-16-|", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0": userProfileImageView]))
        
        
        //mainLabel constraints
        addConstraint(NSLayoutConstraint(item: mainLabel, attribute: .top, relatedBy: .equal, toItem: ImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: mainLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        addConstraint(NSLayoutConstraint(item: mainLabel, attribute: .right, relatedBy: .equal, toItem: ImageView, attribute: .right, multiplier: 1, constant: -36))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : mainLabel]))
        
        //Download Button
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:[v0(30)]-12-|", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : Download]))
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:[v0(30)]", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : Download]))
         addConstraint(NSLayoutConstraint(item: Download, attribute: .top, relatedBy: .equal, toItem: ImageView, attribute: .bottom, multiplier: 1, constant: 16))
        addConstraint(NSLayoutConstraint(item: Download, attribute: .left, relatedBy: .equal, toItem: mainLabel, attribute: .right, multiplier: 1, constant: 10))
        
        
        
        
        //commentLabel constraints
        addConstraint(NSLayoutConstraint(item: commentLabel, attribute: .top, relatedBy: .equal, toItem: mainLabel, attribute: .bottom, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint(item: commentLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        addConstraint(NSLayoutConstraint(item: commentLabel, attribute: .right, relatedBy: .equal, toItem: ImageView, attribute: .right, multiplier: 1, constant: -36))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : commentLabel]))
        
       
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
