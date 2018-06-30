//
//  ArticleWebViewController.swift
//  LoginApp
//
//  Created by Warm-mac on 2018/5/26.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebViewController: UIViewController,WKNavigationDelegate ,WKUIDelegate{

//    @IBOutlet weak var navItem: UINavigationItem!

    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var web: WKWebView!

    var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        web.navigationDelegate=self
        web.uiDelegate=self
        if let url = url {
            web.load(URLRequest(url: URL(string: url)!))
                web.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
        }
    }
    
  


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath=="estimatedProgress" {
            progressBar.setProgress(Float(web.estimatedProgress), animated: true)
            if web.estimatedProgress==1{
                progressBar.isHidden=true
            }else{
            }
        }
        
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        navItem.title=web.title
    }

}
