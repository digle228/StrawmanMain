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
    
    var coordinate = CLLocationCoordinate2DMake
    
    let annotation = MKPointAnnotation()
    
    var parseUserData:[PFObject]!
    
    var data = [PFObject]()
    
    
    func showLocation(timer:NSTimer) {
        //        print("loc \(self.locationManager.location)");
    }
    
    
    
    
    
    
    //目前使用者的位置
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation){
        
        
        if self.isFirstGetLocation == false {
            isFirstGetLocation = true
            let region = MKCoordinateRegion(center: userLocation.location!.coordinate, span:
                MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
            mapView.region = region
        }
        //        print("\(userLocation.location?.coordinate)")
        
        
        let region = MKCoordinateRegionMakeWithDistance(userLocation.location! .coordinate, 2000, 2000)
        mapView.setRegion(region, animated: true)
        
        
    }
    
    
    func showUserslocationFromParse(){
        //    var user = PFUser.currentUser()
        let query = PFUser.query()
        query?.findObjectsInBackgroundWithBlock{
            (objects:[PFObject]?, error:NSError?) -> Void in
            if error == nil && objects != nil {
                for object in objects! {
                    let user:PFUser = object as! PFUser
                    self.data.append(user as PFObject)
//                    print(self.data)
                    let location = user["geopoint"] as! PFGeoPoint
                    let name = user["name"] as! String
                    let mobile = user["mobile_num"] as! String
                    let address = user["address"] as! String
                    let coordinate = CLLocationCoordinate2DMake(location.latitude, location.longitude)
                    print(coordinate)
                    self.annotation.title = name + mobile
                    self.annotation.subtitle = address
                    self.annotation.coordinate = CLLocationCoordinate2DMake(location.latitude, location.longitude)
                    var locationadd = self.mapView.addAnnotation(self.annotation)
                    
                }
            }
        }
        
        //Parse抓資料2
        //        let queryFor = PFQuery(className: "_User")
        //        queryFor.findObjectsInBackgroundWithBlock { (array:[PFObject]?, err:NSError?) -> Void in
        //            if err == nil && array != nil {
        //                if let array = array {
        //                    self.parseUserData = array
        //                    let geopoint = self.parseUserData
        //                    print(self.parseUserData)
        //                }
        //
        //            }
        //        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        showUserslocationFromParse()
        
        
        //        var notification:UILocalNotification = UILocalNotification()
        //        notification.alertBody = "熱門訊息通知!"
        //        notification.fireDate = NSDate(timeIntervalSinceNow: 1)
        //        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        //
        


        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        NSTimer.scheduledTimerWithTimeInterval(3600, target: self, selector: "showLocation:", userInfo: nil, repeats: true)
        
        let vege = MyAnnotation(coordinate: CLLocationCoordinate2DMake(25.1336, 121.5650), title: "維尼爸", subtitle: "0987987087" )
        let vege1 = MyAnnotation(coordinate: CLLocationCoordinate2DMake(25.044477, 121.532619), title: "桔森", subtitle: "0917809888" )
        let vege2 = MyAnnotation(coordinate: CLLocationCoordinate2DMake(25.045655, 121.531010), title: "大野狼的家", subtitle: "0933566699" )
        let vege3 = MyAnnotation(coordinate: CLLocationCoordinate2DMake(25.045767, 121.532609), title: "小咪咪的家", subtitle: "0988566699")
        
        self.mapView.addAnnotation(vege)
        self.mapView.addAnnotation(vege1)
        self.mapView.addAnnotation(vege2)
        self.mapView.addAnnotation(vege3)



        
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
