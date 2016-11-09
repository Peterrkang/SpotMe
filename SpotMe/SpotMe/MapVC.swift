//
//  ViewController.swift
//  SpotMe
//
//  Created by Peter Kang on 11/2/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase
import GoogleMaps

class MapVC: UIViewController, CLLocationManagerDelegate{

    
    
    private var events = [Event]()
    
    @IBOutlet weak var mapView: UIView!
    var googleMapsView: GMSMapView!

    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.googleMapsView = GMSMapView(frame: self.mapView.frame)
        self.view.addSubview(googleMapsView)

        

    }


    
    override func viewDidAppear(_ animated: Bool) {
        

    }
    
    
    

    
}
