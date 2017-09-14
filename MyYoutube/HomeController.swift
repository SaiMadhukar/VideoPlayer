//
//  HomeControllerViewController.swift
//  MyYoutube
//
//  Created by Sai Madhukar on 06/07/17.
//  Copyright © 2017 Sai Madhukar. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import AVFoundation
import FirebaseDatabase
import AVKit

class HomeController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    var nav : UINavigationController?
    
    let FIRDatabase = Database.database().reference()


    func getDirectoryPath() -> String {

        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

    let ref = Storage.storage().reference(forURL: "gs://myyoutube-33091.appspot.com/")
    private var MainTitle = ""
    private var Comment = "NCS ∙•‣ 1,32,435 views ∙•‣ 2 years"

    private var videosNames = ["Alan Walker - Fade [NCS Release]","Cartoon - On & On (feat. Daniel Levi) [NCS Release]","Tobu & Itro - Sunburst [NCS Release]","Itro & Tobu - Cloud 9 [NCS Release]","DEAF KEV - Invincible [NCS Release]","Tobu - Hope [NCS Release]","Disfigure - Blank [NCS Release]","Ahrix - Nova [NCS]","Different Heaven & EH!DE - My Heart [NCS Release]"]

    
    lazy var videosCollection: UICollectionView = {
        
        var layout = UICollectionViewFlowLayout()
        var vc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vc.dataSource = self
        vc.delegate = self
        vc.backgroundColor = .white
        return vc
        
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        
        videosCollection.register(YoutubeVideoCell.self, forCellWithReuseIdentifier: "videos")
        view.addSubview(videosCollection)
        videosCollection.frame = view.bounds
        videosCollection.contentInset = UIEdgeInsetsMake(0, 0, 46, 0)
        view.backgroundColor = .white
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
      
    }
   
    
 
    
    
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let imageslocalPath = (self.getDirectoryPath() as NSString).appendingPathComponent(videosNames[indexPath.row]+".jpg")
        let videoslocalPath = (self.getDirectoryPath() as NSString).appendingPathComponent(videosNames[indexPath.row]+".mp4")
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videos", for: indexPath) as! YoutubeVideoCell
        cell.backgroundColor = UIColor.clear
        cell.userProfileImageView.image = UIImage(named: "\(indexPath.row % 5)")
        cell.mainLabel.text = videosNames[indexPath.row] + MainTitle
        cell.commentLabel.text =  Comment
        cell.Download.setImage(#imageLiteral(resourceName: "Download").withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
        cell.Download.addTarget(self, action: #selector(downloadBtnPressed(_ :)), for: UIControlEvents.touchUpInside)
        cell.Download.tag = 0
        cell.ImageView.imageFromFirStorage(withLocalPath: imageslocalPath, FirStorageRef: ref.child("images"), fileName: videosNames[indexPath.row], completionHandler: {(success) in})
        
        
        if isFileAvailableInLocalFileSystem(LocalPath: videoslocalPath){
            cell.Download.setImage(#imageLiteral(resourceName: "Delete2").withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
            cell.Download.tag = 1
        }

        return cell
    
    }
    
    
    
    
    
    @objc func downloadBtnPressed(_ sender : UIButton)
    {
    
        let touchPoint = sender.convert(CGPoint.zero, to: videosCollection)
        let indexPath = videosCollection.indexPathForItem(at: touchPoint)
         let selectedCell = videosCollection.cellForItem(at: indexPath!) as! YoutubeVideoCell
         let videoslocalPath = (self.getDirectoryPath() as NSString).appendingPathComponent(videosNames[indexPath!.row]+".mp4")
        
        if selectedCell.Download.tag == 1{
            
            print("Deleteing video...")
            HandleVideoDelete(videoRef: videoslocalPath, videoCell: selectedCell)
            return
        }
        
        selectedCell.Download.setImage(#imageLiteral(resourceName: "Delete2").withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
        selectedCell.Download.tag = 1
        let videoRef = ref.child(videosNames[indexPath!.row]+".mp4")
        downloadVideosFromFirStorage(withPath: videoRef, withName: videosNames[indexPath!.row], completionHandler: {
        (success) in
            
            if !success{
                selectedCell.Download.setImage(#imageLiteral(resourceName: "Download").withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
                selectedCell.Download.tag = 0
                print("Video Failed To download")
            }
            
            self.videosCollection.reloadData()
            selectedCell.Download.tintColor = UIColor(red: 73.0/255.0, green: 133.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            print("video dowloaded - completion handler")
        
        })
        
    }
   
    func HandleVideoDelete(videoRef: String , videoCell cell: YoutubeVideoCell)
    {
        
        do {
            
            try FileManager.default.removeItem(atPath: videoRef)
            cell.Download.tag = 0
        }catch{
                print("No FIle Exists to Delete")
        }
        videosCollection.reloadData()
        
        
        
    }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        print("Video at \(indexPath.row) is selected")
        let PlayerController = AVPlayerViewController()
        var playerView = AVPlayer()
        let videoRef = ref.child(videosNames[indexPath.row]+".mp4")
        let localPath = (self.getDirectoryPath() as NSString).appendingPathComponent(videosNames[indexPath.row]+".mp4")
        

        if isFileAvailableInLocalFileSystem(LocalPath: localPath)
        {
            playerView = AVPlayer(url: URL(fileURLWithPath: localPath))
            PlayerController.player = playerView
            self.present(PlayerController, animated: false, completion:nil)
            playerView.play()
            return
        }
        
        //Check Network Connectivity
        if !Reachability.isConnectedToNetwork(){
            print("Internet Connection Not Available!")
            let alert = MyAlertController(title: "Internet Not Available!", message: "Please Turn On Mobile Data Or Wifi", preferredStyle: .alert)
            let ok = UIAlertAction(title:"Ok", style: .cancel, handler: nil)
            let cancel = UIAlertAction(title:"Cancel", style: .default, handler: nil)
            alert.addAction(ok)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
            print("failed to play from firebase metadata may be nil")
            return
        }
        
        //Get Video From Firebase
        videoRef.getMetadata(completion: { (metadata, error) in
            if error == nil {
                print(metadata!.downloadURL()!)
                playerView = AVPlayer(url: URL(string: "\(String(describing: metadata!.downloadURL()!))")!)
                PlayerController.player = playerView
                self.present(PlayerController, animated: false, completion:nil)
                playerView.play()
            }
            else{
                let alert = MyAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title:"ok", style: .cancel, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
                print("failed to play from firebase metadata may be nil")
            }
        })
        
     //   let videoPlayer = VideoPlayerObject()
        
        
    }
    
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: videosCollection.bounds.width, height: (videosCollection.bounds.width * 9 / 16) + 80)
    }
    

}
