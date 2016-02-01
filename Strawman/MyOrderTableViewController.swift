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
    
    var orderData = [orderindata]()
    var orderDate2 = [orderdata]()
    
    
    
    func getDataFromServer(){
//        print("order頁面的auth_token ＝\(auth_token)")
        let userUrl = "http://139.162.37.39/"
        let apiPath = userUrl + "api/v1/orders"
        let dic = ["auth_token": "\(auth_token)"]
        
        Alamofire.request(.GET, apiPath,parameters: dic).responseJSON { response in switch response.result {
        case .Success(let data):
            
            let responseJson = JSON(data)//["data"]
            let result = responseJson["data"]
            for (_, subJson):(String, JSON) in result {
                
                //            var id:String
                //            var name:String
                //            var delivery_address:String
                //            var delivery_date:String
                //            var spice:String
                //            var rice:String
                //            var items:[String]
                
                let id = subJson["id"]
                let name = subJson["name"]
                let address = subJson["delivery_address"]
                let date = subJson["delivery_date"]
                let spice = subJson["spice"]
                let rice = subJson["rice"]
                let items = subJson["items"]
                let orderDatainCell = orderdata(json: subJson)
                self.orderData.append(orderindata(json: result))
                self.orderDate2.append(orderDatainCell)
//                print(data)
                print(auth_token)
//                print(self.orderData)
                
                
                
                
                //            let order = ([id: id, name: name, address: address, mobil_num: mobil_num, email: email])
                
                //            print(" \(user)")
                
                //            self.userData.append(id)
                //            self.userData.append(name)
                //            self.userData.append(address)
                //            self.userData.append(mobil_num)
                //            self.userData.append(email)
                
                
                
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
        
        //        調高度
        //        self.dataTableView.rowHeight = UITableViewAutomaticDimension
        //        self.dataTableView.estimatedRowHeight = 500
        self.dataTableView.reloadData()
        
        
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
        if orderData.count > 0 {
            
            return orderData.count
            //            print("count \(orderData.count) \(orderData.first!.items.count)")
            //            return orderData.first!.items.count
            
        }
        else {
            return 0
        }
        
    }
    
    
    
    
    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell2",forIndexPath: indexPath) as! MyOrderTableViewCell
        
        //        let item = orderData.first!.items[indexPath.row]
        //        cell.orderText?.text = item.product_name
        
        let order = self.orderDate2[indexPath.row]
        
        cell.idLabel?.text = order.id + order.delivery_date
        cell.nameLabel?.text = order.delivery_date
        cell.addressLabel.text = order.delivery_address
        
        
        
        
        
        
//        let orderNum = orderData[indexPath.row]
//        
//        cell.idLabel?.text = orderData.first!.id
//        cell.nameLabel?.text = orderData.first!.delivery_date
//        cell.addressLabel.text = orderData.first!.delivery_address
        
        //        let id = result["id"]
        //        let name = result["name"]
        //        let address = result["delivery_address"]
        //        let date = result["delivery_date"]
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



