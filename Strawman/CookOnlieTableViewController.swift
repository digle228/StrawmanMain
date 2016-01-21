//
//  CookOnlieTableViewController.swift
//  vagetableSale
//
//  Created by wusu chiang on 2016/1/10.
//
//

import UIKit

class CookOnlieTableViewController: UITableViewController {
    var vagetabletype = ["根莖類", "瓜果類", "葉菜類", "辛香料"]
   
    
    var 根莖類 = ["地瓜", "芋頭", "甜菜根", "紅白蘿蔔", "馬玲薯", "大頭菜"] //6

    var 瓜果類 = ["小黃瓜", "大黃瓜", "絲瓜", "南瓜", "瓠瓜", "四季豆", "甜豆", "茄子", "彩椒", "青椒", "青白花", "椰菜", "花生"] //13
    
    var 葉菜類 = ["大小白菜","萵苣", "茼蒿", "高麗菜", "青江菜", "豆苗", "小松菜", "黑葉白", "菊苣", "韭菜", "包心", "白娃娃菜", "芥菜", "空心菜", "芥藍菜", "天津", "白菜", "地瓜葉" ]//18

    var 辛香料 = ["蔥", "蒜", "薑", "香菜", "九層塔", "香椿"] //6
    
    

    @IBOutlet var contentTableView: UITableView!
    
//    var vagetables: [VagetableProduct] {
//        var list = List.list()
//        return list[0].name
//      
//        
//    }
//    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CookTableViewCell", bundle: nil)
        self.contentTableView.registerNib(nib, forCellReuseIdentifier: "cellStyle")
        
        self.contentTableView.rowHeight = UITableViewAutomaticDimension
        self.contentTableView.estimatedRowHeight = 50
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    // MARK: - Table view data source
//
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return vagetabletype.count
    }

    
    //section標題

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String?
        

        switch section {
        case 0:
            title = "根莖類"
        case 1:
            title = "瓜果類"
        case 2:
            title = "葉菜類"
        case 3:
            title = "辛香類"
        default:
            break
        }
        return title
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount = 0
        
        switch section  {
        case 0:
            rowCount = 根莖類.count
        case 1:
            rowCount = 瓜果類.count
        case 2:
            rowCount = 葉菜類.count
        case 3:
            rowCount = 辛香料.count

        default:
            break
        }
     
        return rowCount
    }


    //Xib 連 table View
  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellStyle",forIndexPath: indexPath) as! CookTableViewCell

        switch indexPath.section  {
        case 0:
            cell.vagetableNameLabel?.text = 根莖類[indexPath.row]
        case 1:
            cell.vagetableNameLabel?.text = 瓜果類[indexPath.row]
        case 2:
            cell.vagetableNameLabel?.text = 葉菜類[indexPath.row]
        case 3:
            cell.vagetableNameLabel?.text = 辛香料[indexPath.row]
            
        default:
            break
        }

    
    return cell
    }

    
    
    //到  MovieWeb頁面

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("youtubeCookMovie")
        
        self.presentViewController(controller!, animated: true, completion: nil)
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
