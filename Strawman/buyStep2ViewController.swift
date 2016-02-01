//
//  buyStep2ViewController.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/28.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import UIKit

class buyStep2ViewController: UIViewController {
   
    var peoplenumInStep2: AnyObject!


    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func datePickerAction(sender: AnyObject) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBarController?.hidesBottomBarWhenPushed = false
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
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
