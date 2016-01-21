//
//  FbLoginViewController.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/14.
//
//

import UIKit
import FBSDKLoginKit


class FbLoginViewController: UIViewController {
    
    
    
    @IBAction func KeyInEmail(sender: AnyObject) {
    }
    
    @IBAction func KeyInPassword(sender: AnyObject) {
    }
    @IBAction func FbLoginAction(sender: AnyObject) {
        
    }
    
    
    
    
    
    func loginButton(FbLoginBu: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(FbLoginBu: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                print("User Email is: \(userEmail)")
            }
        })
    }
    //判斷FB使用者是否登入
    override func viewWillAppear(animated: Bool) {
        let buyVegetable = self.storyboard?.instantiateViewControllerWithIdentifier("BuyStep1ViewController")
        if let accessToken = FBSDKAccessToken.currentAccessToken() {
            
            self.dismissViewControllerAnimated(true, completion: nil)
            print("\(buyVegetable)\(accessToken)")
            //            self.presentViewController(buyVegetable!, animated: true, completion: nil)
            
        } else {
            
            let fbLoginPage = self.storyboard?.instantiateViewControllerWithIdentifier("FBLoginViewController")
            
            print("\(fbLoginPage)")
            
            //            self.dismissViewControllerAnimated(true, completion: nil)
            
            
        }
        
    }
    
    //    override func viewDidDisappear(animated: Bool) {
    //        if let accessToken = FBSDKAccessToken.currentAccessToken() {
    //            let buyVegetable = self.storyboard?.instantiateViewControllerWithIdentifier("BuyStep1ViewController")
    //            self.tabBarController?.presentViewController(buyVegetable!, animated: true, completion: nil)
    //
    //
    //
    //        } else {
    //            let fbLoginPage = self.storyboard?.instantiateViewControllerWithIdentifier("FBLoginViewController")
    //
    //    }
    //    }
    
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
