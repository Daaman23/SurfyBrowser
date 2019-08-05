//
//  ViewController.swift
//  Surfy
//
//  Created by Daaman Kaushal on 2019-07-23.
//  Copyright © 2019 Daaman Kaushal. All rights reserved.
//

import UIKit

import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate{
    
    
    
    @IBOutlet weak var ActInd: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "http://www.google.com")!
    
    
    let request = URLRequest(url: url)
        
        webView.load(request)
        
        webView.addSubview(ActInd)
        ActInd.startAnimating()
        
        webView.navigationDelegate = self
        ActInd.hidesWhenStopped = true
        
        
    
    }
    
    @IBAction func back(_ sender: Any) {
        
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    
    @IBAction func forward(_ sender: Any) {
        
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        webView.reload()
    }
    
    @IBAction func stop(_ sender: Any) {
        
        webView.stopLoading()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        ActInd.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        ActInd.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        ActInd.stopAnimating()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        let url = URL(string: "http://\(searchBar.text!)")!
        
        
        let request = URLRequest(url: url)
        
        webView.load(request)
        
        
    }
    

}

