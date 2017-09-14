//
//  TrendingViewController.swift
//  MyYoutube
//
//  Created by Sai Madhukar on 06/07/17.
//  Copyright © 2017 Sai Madhukar. All rights reserved.
//

import UIKit
import MapKit


class TrendingController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    
    lazy var mapView : MKMapView = {
        
        let mv = MKMapView()
        mv.backgroundColor = .orange
        mv.delegate = self
        
       return mv
    }()
    
    
//    var searchBar : UISearchBar = {
//
//        var sb = UISearchBar()
//        sb.backgroundColor = .white
//
//        return sb
//    }()
    
    let manager = CLLocationManager()
    let route : MKRoute! = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
     
       // searchBar.layer.cornerRadius = 10
        navigationController?.isNavigationBarHidden = true
        view.addSubview(mapView)
       // view.addSubview(searchBar)
        
        view.addVisualConstarints(format: "H:|[v0]|", views: mapView)
      //  view.addVisualConstarints(format: "H:|-8-[v0]-28-|", views: searchBar)
        view.addVisualConstarints(format: "V:|[v0]|", views: mapView)
     //   view.addVisualConstarints(format: "V:|-20-[v0(40)]", views: searchBar)
        
        mapView.showsUserLocation = true
        mapView.showsScale = true
        mapView.showsPointsOfInterest = true
        manager.requestAlwaysAuthorization()
        manager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            print("location enabled")
             manager.delegate = self
            manager.startMonitoringSignificantLocationChanges()
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.startUpdatingLocation()
            return
        }

//        let latitude = manager.location?.coordinate.latitude
//        let longitude = manager.location?.coordinate.longitude
//        let houseCoordinates = CLLocationCoordinate2D(latitude: 17.4045075, longitude: 78.4009967)
//        let span = MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.10)
//        mapView.region = MKCoordinateRegionMake(houseCoordinates, span)
//
//        if latitude != nil && longitude != nil {
//           let currentLocation = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
//            mapView.region = MKCoordinateRegionMake(currentLocation, span)
//            print("got locaiton form manger")
//
//        }
//        let tajmahal =  CLLocationCoordinate2D(latitude: 17.3992625, longitude: 78.4921764)
//
//        let point1 = MKPointAnnotation()
//        point1.coordinate = tajmahal
//        point1.title = "Taj Mahal Hotel"
//        mapView.addAnnotation(point1)
        showPins()
      
    }
    
    
    func showVirtualHomePins()
    {
        
        // house coordinates 17.4045075,78.4009967
        //eiffel tower coordinates 48.8583827,2.2936831
        //frankfurt sbi coordinates 50.1100516,8.6626381
        //musieum france 48.8597138,2.3263337
        // 48.8550061,2.3139662
        let latitude = CLLocationDegrees.init(48.8597138)
        let longitude = CLLocationDegrees.init(2.3263337)
        let houseCoordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
       // let span = MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.10)
    
        let point1 = MKPointAnnotation()
        point1.coordinate = houseCoordinates
        point1.title = "Home"
        point1.subtitle = "My Location"
        mapView.addAnnotation(point1)
        
        let point2 = MKPointAnnotation()
        let sbi = CLLocationCoordinate2D(latitude: 48.8550061, longitude: 2.3139662)
        point2.coordinate = sbi
        point2.title = "SBI"
        point2.subtitle = "State Bank Of India"
        mapView.addAnnotation(point2)
        
        
      
    }
    
    
   func showPins()
    {
      // let tajmahal =  CLLocationCoordinate2D(latitude: 17.3992625, longitude: 78.4921764)
        let sbi = CLLocationCoordinate2D(latitude: 48.8550061, longitude: 2.3139662)
      // let kmitCoordinates = CLLocationCoordinate2D(latitude: 17.4045075, longitude: 78.4009967)
        
        let latitude = CLLocationDegrees.init(48.8597138)
        let longitude = CLLocationDegrees.init(2.3263337)
        let houseCoordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegionMake(sbi, span)
         self.mapView.setRegion(region, animated: true)
        
        
        
        let point1 = MKPointAnnotation()
        point1.coordinate = houseCoordinates
        point1.title = "Home"
        point1.subtitle = "My Location"
        mapView.addAnnotation(point1)
        
        let point2 = MKPointAnnotation()
        
        point2.coordinate = sbi
        point2.title = "SBI"
        point2.subtitle = "State Bank Of India"
        mapView.addAnnotation(point2)
        
        
    
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



func ds()
{
    
    
    print("sdafads")
}


extension TrendingController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        mapView.alpha = 0.65
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        mapView.alpha = 1
        
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.endEditing(true)
    }
    
    
    
    
}

