//
//  MapViewController.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/15.
//
//

import UIKit
import CoreLocation
import MapKit
import Parse
class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var isFirstGetLocation = false
    
    let geoCoder = CLGeocoder()
    
    var parseGeopointArray:[CLGeocoder]!

    var parseUserData:[PFObject]!
    var data = [PFObject]()
    
    
    func showLocation(timer:NSTimer) {
        print("loc \(self.locationManager.location)");
    }
    
    
    
    
    
    
    //目前使用者的位置
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation){
       
        if self.isFirstGetLocation == false {
        isFirstGetLocation = true
        let region = MKCoordinateRegion(center:
        userLocation.location!.coordinate, span:
        MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta:
        0.005))
        mapView.region = region
        }
        print("\(userLocation.location?.coordinate)")
        
        
        let region = MKCoordinateRegionMakeWithDistance(userLocation.location! .coordinate, 1000, 1000)
        mapView.setRegion(region, animated: true)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var notification:UILocalNotification = UILocalNotification()
//        notification.alertBody = "熱門訊息通知!"
//        notification.fireDate = NSDate(timeIntervalSinceNow: 1)
//        UIApplication.sharedApplication().scheduleLocalNotification(notification)
//
    
                //    let gf2 = MyAnnotation(coordinate: CLLocationCoordinate2DMake(25.1336, 121.5650), title: "102", subtitle: "who's girl", weigth: 51)
//    var user = PFUser.currentUser()
        let query = PFUser.query()
        query?.findObjectsInBackgroundWithBlock{
            (objects:[PFObject]?, error:NSError?) -> Void in
            if error == nil {
                for object:PFObject! in objects!{
                    let user:PFUser = object as! PFUser
                    
                    self.data.append(user)
                    print(self.data)
                }
            }
        }
        
        
        
        

        
    
 


        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: "showLocation:", userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
