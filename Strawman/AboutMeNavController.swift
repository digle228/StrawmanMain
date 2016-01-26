//
//  AboutMeNavController.swift
//  vagetableSale
//
//  Created by wusu chiang on 2016/1/8.
//
//

import UIKit
import FBSDKLoginKit


class AboutMeNavController: UINavigationController {
    
    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    //判斷FB或使用者是否登入
    func checkUser(){
        //        let buyVegetable = self.storyboard?.instantiateViewControllerWithIdentifier("BuyStep1ViewController")
        
        let fbLoginPage = self.storyboard?.instantiateViewControllerWithIdentifier("FBLoginViewController")
        
        if FBSDKAccessToken.currentAccessToken() != nil || self.appDelegate.message == "Ok" {
            print(self.appDelegate.message)
            //            self.presentViewController(buyVegetable!, animated: true, completion: nil)
            
            
        } else {
            self.presentViewController(fbLoginPage!, animated: true, completion: nil)
            //            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkUser()
         print(appDelegate.auth_token)
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
