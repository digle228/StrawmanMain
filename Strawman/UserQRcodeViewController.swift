//
//  UserQRcodeViewController.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/23.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import UIKit
import Parse
import QRCode

class UserQRcodeViewController: UIViewController {
    @IBOutlet weak var QrcodeImage: UIImageView!

    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QrcodeImage.image = {
            var qrCode = QRCode("auth_token")!
//            qrCode.size = self.QrcodeImage.bounds.size
//            qrCode.color = CIColor(rgba: "FFCD0C")
            qrCode.backgroundColor = CIColor(rgba: "FFCD0C")
            qrCode.errorCorrection = .High
            return qrCode.image }()
        
    
    }
        // Do any additional setup after loading the view.


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
