//
//  ImageFromFireBase.swift
//  MyYoutube
//
//  Created by Sai Madhukar on 06/07/17.
//  Copyright © 2017 Sai Madhukar. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import FirebaseStorage


//Downloading Videos From FireBase
func downloadVideosFromFirStorage(withPath videoRef: StorageReference,withName name: String, completionHandler: @escaping (_ success:Bool) -> Void)
{
    print("Downloading the Video....")
    var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    path!.appendPathComponent(name+".mp4")
    videoRef.write(toFile: path!) { (p, e) in
        if e != nil {
            print(e!.localizedDescription)
            completionHandler(false)
        }
        print("sucessfully Downloaded The Video")
        completionHandler(true)
    }
}



//Dowload Images From FirebaseStorage
extension UIImageView{
    
    public func imageFromLocalFileSystem(LocalPath path: String) -> Bool{
        if FileManager.default.fileExists(atPath: path){
            
            // print("Local FIle Path :\(path)")
            self.image = UIImage(contentsOfFile: path)
            return true
        }
        return false
    }
    
    public func imageFromFirStorage(withLocalPath localPath : String,FirStorageRef ref: StorageReference , fileName : String , completionHandler: @escaping (_ success:Bool)-> Void) {
        if FileManager.default.fileExists(atPath: localPath){
            
            // print("Image is available in Local Storage")
            self.image = UIImage(contentsOfFile: localPath)
            return
        }
        var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        path!.appendPathComponent(fileName+".jpg")
        
        let imageRef = ref.child("\(fileName).jpg")
        
         imageRef.write(toFile: path!) { (p, e) in
            if e != nil {
                print(e!.localizedDescription)
                completionHandler(false)
            }
            //print("sucessfully Downloaded The Video")
            _ = self.imageFromLocalFileSystem(LocalPath: localPath)
            completionHandler(true)
        }

    }
    
    
}





//Downloading Images From FireBaseVideos
extension UIImageView{
    
    public func imageFromFirebaseVideos(withName name: String ,FIRStorageVideoRefWithImageURL videoRef: StorageReference){
        videoRef.getMetadata { (metaData, err) in
            
            if err != nil{
                print("Failed to get Image URl")
                return
            }
            let url = metaData?.downloadURL()!
            let image = self.getThumbnailFromVideo(path: url!)
            self.image = image!
            let rawJPG = UIImageJPEGRepresentation(image!, 1)
            
            if rawJPG != nil{
                var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                path!.appendPathComponent(name+".jpg")
                try! rawJPG!.write(to: path!)
                //  print("image successfully witten to user file system")
            }
            else{
                print("Image failed to Download")
            }
            
        }
    }
    
    func getThumbnailFromVideo(path: URL) -> UIImage? {
        
        do {
            //print("Getting the Image From FirVideo")
            let asset = AVURLAsset(url: path , options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            self.image = thumbnail
            return thumbnail
        }
        catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
        
    }
    
}



class MyAlertController : UIAlertController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let screenBounds = UIScreen.main.bounds
        
        if (preferredStyle == .actionSheet) {
            
            self.view.center = CGPoint(x: screenBounds.size.width*0.5, y: screenBounds.size.height - (self.view.frame.size.height*0.5) - 8)
            
        } else {
            self.view.center = CGPoint(x: screenBounds.size.width*0.5, y: screenBounds.size.height*0.5)
        }
    }
}


