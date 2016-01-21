//
//  MyOrderTableViewController.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/16.
//
//

import UIKit
import Alamofire
import SwiftyJSON

class MyOrderTableViewController: UITableViewController {
    
    
    
    @IBOutlet var dataTableView: UITableView!

    var userData = [String]()

    
    func getDataFromServer(){
        let userUrl = "http://139.162.37.39/api/v1"
        let apiPath = userUrl + "/users/"
        
        
        Alamofire.request(.GET, apiPath,parameters: nil).responseJSON { response in switch response.result {
        case .Success(let data):
            
            let result = JSON(data)["data"]
        
        for (_, subJson):(String, JSON) in result {
            
            let id = subJson["id"].stringValue
            let name = subJson["name"].stringValue
            let address = subJson["address"].stringValue
            let mobil_num = subJson["mobil_num"].stringValue
            let email = subJson["email"].stringValue
            let user = ([id: id, name: name, address: address, mobil_num: mobil_num, email: email])

//            print(" \(user)")

            self.userData.append(id)
            self.userData.append(name)
            self.userData.append(address)
            self.userData.append(mobil_num)
            self.userData.append(email)





            
        }
        case .Failure(let error):
            print(error)
            
            }
            self.dataTableView.reloadData()

        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromServer()


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userData.count
        
    }

    

    
    @IBOutlet weak var textLabel: UILabel!
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
  let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath)
       
        cell.textLabel?.text = userData[indexPath.row]
        
        print(" \(self.userData)")

        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



