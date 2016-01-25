//
//  VegeTableViewController.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/23.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import UIKit
import Parse

class VegeTableViewController: UITableViewController {
    
    @IBOutlet weak var refresh: UIRefreshControl!
    
    @IBAction func refreshcontroller(sender: AnyObject) {
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    var vegeArray:[PFObject]!
    
    @IBAction func playMovies(sender: AnyObject) {
        
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let query = PFQuery(className: "Vegetable")
        query.findObjectsInBackgroundWithBlock { (array:[PFObject]?, err:NSError?) -> Void in
            
            if let array = array {
                self.vegeArray = array
                self.tableView.reloadData()
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
        if self.vegeArray == nil  {
            return 0
        }
        else {
            return self.vegeArray.count
            
        }
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath) as! vegeTableViewCell
        let vege = self.vegeArray[indexPath.row]
        cell.vagetableNameLabel.text = vege["Name"] as? String
        
        //        cell.addressLabel.text = vege["address"] as? String
        
        let roger = vege["RogerThat"] as? PFFile
        if let urlStrin = roger?.url {
            let url2 = NSURL(string: urlStrin)
            let request = NSURLRequest(URL: url2!)
            let task2 = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data:NSData?, res:NSURLResponse?, err:NSError?) -> Void in
                if let data = data {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        cell.Roger.image = UIImage(data: data)
                        
                    })
                }
                
            })
            task2.resume()
            
        }
        
        let photoFile = vege["image"] as? PFFile
        if let urlStrin = photoFile?.url {
            let url = NSURL(string: urlStrin)
            let request = NSURLRequest(URL: url!)
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data:NSData?, res:NSURLResponse?, err:NSError?) -> Void in
                
                if let data = data {
                    let image = UIImage(data: data)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        cell.vegeImage.image = image
                        
                    })
                }
                
            })
            task.resume()
            
        }
        
        return cell
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //        let result =
        //        UIApplication.sharedApplication().openURL(NSURL(string:
        //            "http://www.apple.com")!)
        //         self.dismissViewControllerAnimated(true, completion: nil)
        
        //
        //        let myWebView = self.storyboard?.instantiateViewControllerWithIdentifier("youtubeCookMovie") as! CookMovieViewController
        //
        //        self.presentViewController(myWebView, animated: true, completion: nil)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let indexPath = self.tableView.indexPathForSelectedRow
//        if (segue.identifier == "Detail"){
//        let object: PFObject = vegeArray[indexPath!.row] as PFObject
//        (segue.destinationViewController as! CookMovieViewController).detailItem = object
//        print(indexPath!.row)
//        
//        
//        }
//    }
//    
    
    
}



