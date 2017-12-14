# WKWebViewProgressBar
Add a progress bar to WKWebView

* iOS 8+ required.
* Use block based KVO and type-safe key path from Swift 4.
* No memnory leaks.

Example:
```swift
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
        
        // load a random URL
        let url = URL(string: "https://www.google.com")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
```