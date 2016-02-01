//
//  user.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/22.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import Foundation
import SwiftyJSON





/*
struct User{
var name:String
var imageUrl:String
}
*/
//"auth_token" = rqhcLvVzoFkLpyYVY3Gf;
//message = Ok;
//"user_id" = 14;

struct Login{
    
    var message:String?
    var auth_token: String?
    var user_id:Int?
    
    init(json: JSON){
        self.message = json["message"].stringValue
        self.auth_token = json["auth_token"].stringValue
        self.user_id = json["user_id"].intValue

    
    }
}