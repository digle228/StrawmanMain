//created with http://guideluxe.com/JsonToSwift
//feedback@GuiDeluxe.com
//@PerryTribolet
//usage: var json:data = data.Populate(data:nsdata)
//where nsdata is an NSData object containing the json string

import Foundation

class Item
{
    var product_name:String = ""
    var status:String = ""
    
    func Populate(dictionary:NSDictionary) {
        
        product_name = dictionary["product_name"] as! String
        status = dictionary["status"] as! String
    }
    class func PopulateArray(array:NSArray) -> [Item]
    {
        var result:[Item] = []
        for item in array
        {
            var newItem = Item()
            newItem.Populate(item as! NSDictionary)
            result.append(newItem)
        }
        return result
    }
    
}

class Datum
{
    var id:Int = 0
    var name:AnyObject? = nil
    var delivery_address:String = ""
    var delivery_date:String = ""
    var spice:Bool = true
    var rice:Bool = true
    var items:[Item] = []
    
    func Populate(dictionary:NSDictionary) {
        
        id = dictionary["id"] as! Int
        name = dictionary["name"] as! AnyObject?
        delivery_address = dictionary["delivery_address"] as! String
        delivery_date = dictionary["delivery_date"] as! String
        spice = dictionary["spice"] as! Bool
        rice = dictionary["rice"] as! Bool
        items = Item.PopulateArray(dictionary["items"] as! [NSArray])
    }
    class func PopulateArray(array:NSArray) -> [Datum]
    {
        var result:[Datum] = []
        for item in array
        {
            var newItem = Datum()
            newItem.Populate(item as! NSDictionary)
            result.append(newItem)
        }
        return result
    }
    
}

class data
{
    var datas:[Datum] = []
    
    func Populate(dictionary:NSDictionary) {
        
        datas = Datum.PopulateArray(dictionary["data"] as! [NSArray])
    }
    
    class func DateFromString(dateString:String) -> NSDate
    {
        let dateFormatter = NSDateFormatter()
        let enUSPosixLocale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter.dateFromString(dateString)!
    }
//    class func Populate(data:NSData) -> data
//    {
//        return Populate(NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary)
//    }
    
    class func Populate(dictionary:NSDictionary) -> data
    {
        var result = data()
        result.Populate(dictionary)
        return result
    }
    
}
