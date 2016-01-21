//
//  BuyStep1ViewController.swift
//
//
//  Created by wusu chiang on 2016/1/13.
//
//

import UIKit
import FBSDKLoginKit

class BuyStep1ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    var arr : NSArray = []
    
    //判斷FB使用者是否登入
    
    override func viewWillAppear(animated: Bool) {
        if let accessToken = FBSDKAccessToken.currentAccessToken() {
            let buyVegetable = self.storyboard?.instantiateViewControllerWithIdentifier("BuyStep1ViewController")
            print("\(buyVegetable)\(accessToken)")

            
            
        } else {
            let fbLoginPage = self.storyboard?.instantiateViewControllerWithIdentifier("FBLoginViewController")
            //            self.dismissViewControllerAnimated(true, completion: nil)
            
            self.presentViewController(fbLoginPage!, animated: true, completion: nil)
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr = ["幸福小倆口(約1-2人份，每週四到六餐)", "全家草幸福(3-4人份，每週四到六餐)"]
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //picker設定
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return arr.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(arr[row])"
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
