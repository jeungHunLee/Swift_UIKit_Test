//
//  ViewController.swift
//  Web View
//
//  Created by 이정훈 on 2022/08/25.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var web: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {    //url를 전달받고 타입을 변환하여 Web View에 load해주는 함수
        let stringToURL = URL(string: url)
        let URLToRequest = URLRequest(url: stringToURL!)
        web.load(URLToRequest)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadWebPage("https://www.google.com/")
        web.navigationDelegate = self
    }
    
    //web에 로딩 중일때 Activity Indicator를 활성화 하도록하는 method
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.startAnimating()    //animation 활성화
        activityIndicator.isHidden = false
    }
    
    //web가 로딩을 완료 했을때 Activity Indicator를 비활성화 하도록하는 method
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    //web이 로딩을 실패 했을 경우 Activity Indicator를 비활성화 하도록하는 method
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    @IBAction func btnUrlGo(_ sender: UIButton) {
        if urlTextField.text!.hasPrefix("https://") {    //text가 "https://"로 시작하는지 확인
            loadWebPage(urlTextField.text!)
        } else {
            urlTextField.text! = "https://" + urlTextField.text!
            loadWebPage(urlTextField.text!)
        }
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        web.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        web.goForward()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        web.reload()
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        web.stopLoading()
    }
}

