//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Paulina Levit on 2/15/16.
//  Copyright © 2016 Paulina Levit. All rights reserved.
//

import UIKit
import WebKit

class WebViewController : UIViewController, WKNavigationDelegate {
    
    var webView : WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.bignerdranch.com")!))
        view = webView
    }
}
