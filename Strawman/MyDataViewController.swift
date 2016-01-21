//
//  MyDataViewController.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/16.
//
//

import UIKit

class MyDataViewController: UIViewController {
    
    
    
        let url = NSURL (string: "http://139.162.37.39/api/")
        
////        let urlRequest = NSURLRequest(URL: url!, cachePolicy:
//            NSURLRequestCachePolicy.ReturnCacheDataElseLoad, timeoutInterval: 30)
//        
//        
//        let task = NSURLSession.sharedSession().dataTaskWithRequest(urlRequest) { (data:NSData?,
//            res:NSURLResponse?, err:NSError?) -> Void in
//            
//            if let data = data {
//                do {
//                    let dic = try NSJSONSerialization.JSONObjectWithData(data, options:
//                        NSJSONReadingOptions.MutableContainers) as! NSDictionary
//                    let array = dic["results"] as! NSArray
//                    for appDic in array {
//                        print("trackName \(appDic["trackName"])")
//                    }
//                } catch {
//                }
//            }}
//        
//
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
