//created with http://guideluxe.com/JsonToSwift
//feedback@GuiDeluxe.com
//@PerryTribolet
//usage: var json:data = data.Populate(data:nsdata)
//where nsdata is an NSData object containing the json string

import Foundation
import SwiftyJSON

struct Item
{
    var product_name:String
    var status:String
    
    init(json: JSON){
        
        self.product_name = json["product_name"].stringValue
        self.status = json["status"].stringValue
    }
}
struct orderindata
{
    var id:String
    var name:String
    var delivery_address:String
    var delivery_date:String
    var spice:String
    var rice:String
    var items:[Item]
    
    init(json: JSON){
        
        let dic = json.arrayValue.first!
        self.id = dic["id"].stringValue
        self.name = dic["name"].stringValue
        self.delivery_address = dic["delivery_address"].stringValue
        self.delivery_date = dic["delivery_date"].stringValue
        self.spice = dic["spice"].stringValue
        self.rice = dic["rice"].stringValue
        self.items = [Item]()
        print("aaa \(json["items"])")
        print("aaa \(json["items"].arrayValue.count)")

        for item in dic["items"].arrayValue {
            let data = Item(json: item )
            self.items.append(data)
        }
    }
}


struct orderdata {
    var id:String
    var name:String
    var delivery_address:String
    var delivery_date:String
    var spice:String
    var rice:String
    
    init(json: JSON){
        
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.delivery_address = json["delivery_address"].stringValue
        self.delivery_date = json["delivery_date"].stringValue
        self.spice = json["spice"].stringValue
        self.rice = json["rice"].stringValue
         }
    }
