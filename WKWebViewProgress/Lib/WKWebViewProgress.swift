//
//  WKWebViewProgress.swift
//  WKWebViewProgress
//
//  Created by Mgen on 14/12/17.
//  Copyright © 2017 Mgen. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewProgress {
    var progressView: UIProgressView
    let webView: WKWebView
    
    // observation.invalidate() will be called automatically when an NSKeyValueObservation is deinited
    var observation: NSKeyValueObservation?
    
    init(webView: WKWebView, progressView: UIProgressView, height: CGFloat = 30) {
        self.webView = webView
        progressView.frame = CGRect(x: 0, y: 0, width: webView.bounds.width, height: height)
        self.progressView = progressView
        
        setup(webView: webView, progressView: progressView, height: height)
    }
    
    private func setup(webView: WKWebView, progressView: UIProgressView, height: CGFloat) {
        observation = webView.observe(\.estimatedProgress, options: [.new]) { [weak self] (child, change) in
            guard let me = self else { return }
            guard let progress = change.newValue else {
                me.hideProgressBar()
                return
            }
            me.showProgressBar(value: Float(progress))
        }
    }
    
    private func hideProgressBar() {
        progressView.isHidden = true
        progressView.progress = 0.0
    }
    
    private func showProgressBar(value: Float) {
        progressView.isHidden = false
        progressView.setProgress(value, animated: true)
        if value >= 1.0 {
            hideProgressBar()
        }
    }
}
