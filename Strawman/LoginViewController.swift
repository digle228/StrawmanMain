//
//  LoginViewController.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/21.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class LoginViewController: UIViewController {

    
    
    
    
//    func getDataFromServer(){
//        let userUrl = "http://139.162.37.39/"
//        let apiPath = userUrl + "api/v1/login"
//        
//        
//        Alamofire.request(.POST, apiPath,parameters: nil).responseJSON { response in switch response.result {
//        case .Success(let data):
//            
//                let result = JSON(data)["data"]
//                let password = subJson["password"].stringValue
//                let email = subJson["email"].stringValue
//                
//                print("\(password)\(email)")
//                
//           
//        case .Failure(let error):
//            print(error)
//            
//            }
//            
//        }
//        
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
