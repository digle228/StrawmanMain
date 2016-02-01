//
//  PostOrder.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/27.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import Foundation
import SwiftyJSON


class PostOrder {
//    var auth_token: String = ""
    var family_type_id: Int?
    var spice: Bool?
    var rice: Bool?
    var delivery_date: String?
    var delivery_address: String?
    
    
    init(json: JSON){
        self.family_type_id = json["family_type_id"].intValue
        self.spice = json["spice"].boolValue
        self.rice = json["rice"].boolValue
        self.delivery_date = json["delivery_date"].stringValue
        self.delivery_address = json["delivery_address"].stringValue

    }

}
