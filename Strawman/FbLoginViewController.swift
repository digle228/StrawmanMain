//
//  FbLoginViewController.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/14.
//
//

import UIKit
import FBSDKLoginKit
import Alamofire
import SwiftyJSON

class FbLoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!

    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func FbLoginAction(sender: AnyObject) {
        
    }
    
    @IBAction func loginActionButton(sender: AnyObject) {
        postDataToServer()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

    func postDataToServer(){
        let userUrl = "http://139.162.37.39/"
        let apiPath = userUrl + "api/v1/login"
        let dic = ["email": self.email.text!,"password": self.password.text! ]

        
        
        Alamofire.request(.POST, apiPath, parameters: dic, encoding: .JSON).responseJSON { response in
            switch response.result {
            case .Success(let data):
                let responseJson = JSON(data)
                let auth_token = data["auth_token"]
                
                print(data["auth_token"])
            case .Failure(let error):
                print("\(error)")
            //  TODO:      400, 401, 404, 500 print("Request failed with error: \(error)")
                
            }
            
        }
    }
    

//        Alamofire.request(.POST, apiPath, parameters: dic, encoding: .JSON).responseJSON { response in
//    switch response.result {
//        case .Success(let data):
//        print(data)
//        case .Failure(let error):
//            print(error)
//            //TODO:      400, 401, 404, 500 print("Request failed with error: \(error)")
//    }
//        }
//    }
//    



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
