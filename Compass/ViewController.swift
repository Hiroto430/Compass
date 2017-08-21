//
//  ViewController.swift
//  Compass
//
//  Created by 小坂部亘 on 2017/08/14.
//  Copyright © 2017 小坂部亘. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UIWebViewDelegate {
    
    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var WebView: UIWebView!
    
    @IBAction func back(_ sender: Any) {
        if WebView.canGoBack {
            WebView.goBack()
        }
    }
    @IBAction func next(_ sender: Any) {
        if WebView.canGoForward {
            WebView.goForward()
        }
    }
    @IBAction func refresh(_ sender: Any) {
        WebView.reload()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        SearchBar.resignFirstResponder()
        
        if let url = URL(string: SearchBar.text!) {
            
            WebView.loadRequest(URLRequest(url: url))
        } else {
            print("ERROR")
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        WebView.loadRequest(URLRequest(url: URL(string: "https://www.google.com")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

