//
//  buyStep4ViewController.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/29.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import UIKit

class buyStep4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        alert()
        // Do any additional setup after loading the view.
    }
    func alert(){
        let mapview = self.storyboard?.instantiateViewControllerWithIdentifier("MapViewController")
        
        let alert = UIAlertController(title: "成功", message: "登入頁面", preferredStyle: UIAlertControllerStyle.Alert )
        let callAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive, handler: { action in })
        //        let callAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive) {
        //            (action) in
        //
        //            self.dismissViewControllerAnimated(true, completion: nil)
        //        }
        alert.addAction(callAction)
        
        self.presentViewController(mapview!, animated: true, completion: nil)
        

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
