//
//  ViewController.swift
//  locser
//
//  Created by Hiloni Mehta on 2/16/20.
//  Copyright © 2020 Hiloni Mehta. All rights reserved.
//

import UIKit 
import CoreLocation
import FirebaseDatabase

class ViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet var vwView: UIView!
    
    @IBOutlet weak var seg: UISegmentedControl!
    
    @IBOutlet weak var viewContainer: UIView!
    
    let locationManager = CLLocationManager()
    
    var simpleView1: UIView!
    var simpleView2: UIView!
    
    //private weak var calender: FSCalender!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Do any additional setup after loading the view.
        locationManager.requestAlwaysAuthorization() //Always authorize(when the app is open in background)
        
        //locationManager.requestWhenInUseAuthorization() //Authorize when the app is in use
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            
        }
        
        simpleView1 = SimpleVC1().view
        simpleView2 = SimpleVC2().view
        viewContainer.addSubview(simpleView2)
        viewContainer.addSubview(simpleView1)
        //let ref = Database.database().reference()
        

    }
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            print(location.coordinate)
            let out = location.coordinate
            let lat = out.latitude
            let long = out.longitude
            let date = Date()
            let formatter = DateFormatter()
            
            formatter.dateFormat = "dd.MM.yyyy"
            let result = formatter.string(from: date)
            
            
            print(result)
            let ref = Database.database().reference()
            //ref.child("someid/lat").setValue(37.52)
            ref.child("posts").childByAutoId().setValue(["latitude":lat, "longitude":long, "date":result])
            }
        }
    
    
    @IBAction func segTapped(_ sender: Any) {

        let getIndex = seg.selectedSegmentIndex
        print(getIndex)
        
        
        
        switch (getIndex){
        case 0: //remove case 0
            //self.vwView.backgroundColor = UIColor.red
            viewContainer.bringSubviewToFront(simpleView1)
            
        case 1:
            //self.vwView.backgroundColor = UIColor.green
            viewContainer.bringSubviewToFront(simpleView2)
        default:
            viewContainer.bringSubviewToFront(simpleView1)
            //print("no select") // have a date view picker here
        }


    }
    
}


