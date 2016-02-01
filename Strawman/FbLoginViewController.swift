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

class FbLoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    
//    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    @IBOutlet weak var FBLoginButton: FBSDKLoginButton!
    
    @IBAction func closeButton(sender: AnyObject) {
        let home = self.storyboard?.instantiateViewControllerWithIdentifier("tabBarController")
        self.presentViewController(home!, animated: false , completion: nil)
    }
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func FbLoginAction(sender: AnyObject) {
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
//        checkUser()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FBLoginButton.delegate = self
        FBLoginButton.readPermissions = ["public_profile", "email"]
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func loginActionButton(sender: AnyObject) {
        
        let email = self.email.text
        let password = self.password.text
        
        if (email?.utf8.count < 4 || password?.utf8.count < 5){
            let alert = UIAlertController(title: "錯誤", message: "請輸入正確email及密碼", preferredStyle: UIAlertControllerStyle.Alert )
            let callAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive, handler: { action in })
            
            alert.addAction(callAction)
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        }else {
            postDataToServer()
            
//            let alert = UIAlertController(title: "成功", message: "登入頁面", preferredStyle: UIAlertControllerStyle.Alert )
//            let callAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive, handler: { action in })
//            alert.addAction(callAction)
//            self.dismissViewControllerAnimated(true, completion: nil)
//            
            
        }
        
        
        
        
    }
    
    
    
    //判斷FB使用者是否登入
    func checkUser(){
        //        let buyVegetable = self.storyboard?.instantiateViewControllerWithIdentifier("BuyStep1ViewController")
        
        let LoginPage = self.storyboard?.instantiateViewControllerWithIdentifier("FBLoginViewController")
        
        if auth_token != ""  {
            
            self.dismissViewControllerAnimated(true, completion: nil)

            
        } else {
            
            self.presentViewController(LoginPage!, animated: true, completion: nil)
            
        }
        
    }
    
    
    //判斷FB使用者是否登入
    
//    func checkUser(){
//        //        let LoginPage = self.storyboard?.instantiateViewControllerWithIdentifier("FBLoginViewController")
//        //
//        //        let buyVegetable = self.storyboard?.instantiateViewControllerWithIdentifier("BuyStep1ViewController")
//        //
//        if FBSDKAccessToken.currentAccessToken() != nil || self.appDelegate.message == "Ok" {
//            self.dismissViewControllerAnimated(false, completion: nil)
//            //            self.presentViewController(buyVegetable!, animated: true, completion: nil)
//        } else {
//            //            self.presentViewController(LoginPage!, animated: true, completion: nil)
//            //                        self.dismissViewControllerAnimated(true, completion: nil)
//            
//            
//        }
//        
//        
//    }
    
    
    
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
                let token = data["auth_token"] as? String
                let message = data["message"] as? String
                print("\(responseJson)\(message)")
                auth_token = token!
                
                let alert = UIAlertController(title: "成功", message: "登入頁面", preferredStyle: UIAlertControllerStyle.Alert )
//                let callAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive, handler: { action in })
                let callAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive) {
                    (action) in
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
                alert.addAction(callAction)
                self.presentViewController(alert, animated: true, completion: nil)
//                self.dismissViewControllerAnimated(true, completion: nil)
                

                

            case .Failure(let error):
                print("\(error)")

            }
            
        }
        
       }
    
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if  segue.identifier == "Detail"{
            
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
    //|| auth_token !=
    
    
    
    func loginButton(FbLoginBu: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        auth_token = String()
        print("User Logged In")
        if result.token != nil{
            auth_token = result.token.tokenString
                self.dismissViewControllerAnimated(false, completion: nil)
                
            }
            
    }
    

//        print("LoingPage\(appDelegate.auth_token)")
//        appDelegate.auth_token = result.token.tokenString
//        self.dismissViewControllerAnimated(false, completion: nil)
//
//        if ((error) != nil)
//        {
//            // Process error
//        }
//        else if result.isCancelled {
//            // Handle cancellations
//        }
//        else {
//            // If you ask for multiple permissions at once, you
//            // should check if specific permissions missing
//            if result.grantedPermissions.contains("email")
//                
//            {
//                
//            }
//        }
//    }
    
    
    func loginButtonDidLogOut(FbLoginBu: FBSDKLoginButton!) {
        print("User Logged Out")
        auth_token = String()

    }
    
    
    func returnUserData() {
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
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

