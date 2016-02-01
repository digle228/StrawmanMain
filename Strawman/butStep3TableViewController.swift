//
//  butStep3TableViewController.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/29.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import UIKit
import Parse

class butStep3TableViewController: UITableViewController {

    
    
    var coordinate = CLLocationCoordinate2DMake
    
    
    var parseUserData:[PFObject]!
    
    var data: [PFObject]! = []


    
    override func viewDidLoad() {
        super.viewDidLoad()
        marKetMan()

        }


    func marKetMan(){
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
                    self.tableView.reloadData()
                    print(self.data)

                }
            }
        }
    }
    
        
    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.data == nil  {
            return 0
        }
        else {
            return self.data.count
            
        }
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath) as! buyStep3TableViewCell
        print(self.data)
        let marketman = self.data[indexPath.row]
        cell.nameLabel.text = marketman["name"] as? String
        cell.telLabel.text = marketman["mobile_num"] as? String
        cell.addressLabel.text = marketman["address"] as? String
        let photoFile = marketman["image"] as? PFFile
        let urlStr = photoFile?.url
        let url = NSURL(string: urlStr!)
        let marimageView = cell.marImage as UIImageView
        marimageView.sd_setImageWithURL(url, placeholderImage: nil)
        
        //        let roger = vege["RogerThat"] as? PFFile
        //        if (let urlStr2 = roger?.url ) == nil {
        //
        //        } else {
        //            let url2 = NSURL(string: urlStr2)
        //        let rogerTaht = cell.Roger as UIImageView
        //        rogerTaht.sd_setImageWithURL(url2, placeholderImage: nil)
        //
        //        }
        
        
        //        let photoFile = vege["image"] as? PFFile
        //        if let urlStr = photoFile?.url {
        //            let url = NSURL(string: urlStr)
        //
        //            let request = NSURLRequest(URL: url!)
        //            let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data:NSData?, res:NSURLResponse?, err:NSError?) -> Void in
        //
        //                if let data = data {
        //                    let image = UIImage(data: data)
        //                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
        //                        cell.vegeImage.image = image
        //
        //                    })
        //                }
        //
        //            })
        //            task.resume()
        //
        //        }
        
        return cell
        
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
