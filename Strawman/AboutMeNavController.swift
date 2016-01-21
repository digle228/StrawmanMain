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
    
    
    
    //判斷FB或使用者是否登入
    
    override func viewWillAppear(animated: Bool) {
    
        if let accessToken = FBSDKAccessToken.currentAccessToken() {
            let AboutMe = self.storyboard?.instantiateViewControllerWithIdentifier("AboutMeNavController")
            
            print("\(AboutMe)\(accessToken)")

            
        } else {
            let fbLoginPage = self.storyboard?.instantiateViewControllerWithIdentifier("FBLoginViewController")
            
            self.presentViewController(fbLoginPage!, animated: true, completion: nil)
            
            print("\(fbLoginPage)")

            }

        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
