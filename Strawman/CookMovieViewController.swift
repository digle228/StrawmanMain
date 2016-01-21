//
//  CookMovieViewController.swift
//  vagetableSale
//
//  Created by wusu chiang on 2016/1/10.
//
//

import UIKit
import SafariServices
import WebKit

class CookMovieViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var viewInWeb: UIView!
    
    @IBAction func backtoPreView(sender: AnyObject) {
        
        
        self.dismissViewControllerAnimated(true, completion: nil)

//        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("NavCook")
//        self.showViewController(controller!, sender: nil)
//        self.presentViewController(controller!, animated: true, completion: nil)
        
    
    }
    override func viewDidLoad() {

        
//        let url = NSURL(string: "https://www.youtube.com/results?search_query=%E5%9C%B0%E7%93%9C+%E6%96%99%E7%90%86")
//        _ = SFSafariViewController(URL: url!)
//        self.dismissViewControllerAnimated(true, completion: nil)
//        self.presentViewController(controller, animated:true, completion: nil)
        
        
        
        let webView = WKWebView(frame:self.viewInWeb.frame)
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        let url = NSURL(string: "https://www.youtube.com/results?search_query=%E5%9C%B0%E7%93%9C+%E6%96%99%E7%90%86")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)

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
