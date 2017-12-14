//
//  WebViewController.swift
//  WKWebViewProgress
//
//  Created by Mgen on 14/12/17.
//  Copyright © 2017 Mgen. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var webView: WKWebView!
    var webViewProgressView: UIProgressView!
    var webViewProgress: WKWebViewProgress!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isTranslucent = false
        
        // setup WKWebView
        webView = WKWebView(frame: view.bounds)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(webView)
        
        // setup UIProgressView
        webViewProgressView = UIProgressView(progressViewStyle: .default)
        webViewProgressView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 2)
        view.addSubview(webViewProgressView)
        
        // enable the progress bar by creating a WKWebViewProgress Object
        webViewProgress = WKWebViewProgress(webView: webView, progressView: webViewProgressView)
        
        let url = URL(string: "https://www.google.com")!
        let request = URLRequest(url: url)
        webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
