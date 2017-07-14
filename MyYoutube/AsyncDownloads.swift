//
//  AsyncDownloadExtensions.swift
//  MyYoutube
//
//  Created by Sai Madhukar on 06/07/17.
//  Copyright © 2017 Sai Madhukar. All rights reserved.
//

import Foundation
import UIKit



// Download Images From URL Asynchronously
extension UIImageView {
    
    public func imageFromLocalFileSystem(Localpath path: String, GlobalPath url: String,ImageName name: String)
    {
        if FileManager.default.fileExists(atPath: path)
        {
            // print("Local FIle Path :\(path)")
            self.image = UIImage(contentsOfFile: path)
            return
        }
        else{
            imageFromServerURL(urlString: url, ImageName: name)
        }
        
        
    }
    public func imageFromServerURL(urlString: String,ImageName filename: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                path!.appendPathComponent(filename+".jpg")
                self.image = image!
                let rawJPG = UIImageJPEGRepresentation(image!, 0.5)
                if rawJPG != nil{
                    
                    try! rawJPG!.write(to: path!)
                          print("image successfully witten to user file system")
                }
                else{
                    print("Image failed to Download")
                }
            })
        }).resume()
    }
    
}




public func isFileAvailableInLocalFileSystem(LocalPath path: String) -> Bool
{
    if FileManager.default.fileExists(atPath: path)
    {
        return true
    }
    return false
}




