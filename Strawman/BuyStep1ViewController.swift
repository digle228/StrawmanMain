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
    
    @IBOutlet weak var textLabel: UILabel!
    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    var arr : NSArray = []
    
    //判斷FB使用者是否登入
    func checkUser(){
        //        let buyVegetable = self.storyboard?.instantiateViewControllerWithIdentifier("BuyStep1ViewController")
        
        let LoginPage = self.storyboard?.instantiateViewControllerWithIdentifier("FBLoginViewController")

        if self.appDelegate.auth_token != ""  {
            
            
        } else {
            
            self.presentViewController(LoginPage!, animated: true, completion: nil)
            
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        checkUser()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arr = ["幸福小倆口","全家草幸福"]
        
        //(約1-2人份，每週四到六餐)(3-4人份，每週四到六餐)
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
        if row == 0 {
            textLabel.text = "【約1-2人份，每週四到六餐】"
        }else{
            textLabel.text = "【約3-4人份，每週四到六餐】"
            textLabel.textColor = UIColor.blackColor()

        }
        
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
