//
//  Auth.swift
//  VK
//
//  Created by APPLE on 16.02.2022.
//

import UIKit
import WebKit

class AuthController: UIViewController {

    var webView = WKWebView() {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        configureWebView()
        request()
    }

    func request() {
        var url = URLComponents()
        url.host = "oauth.vk.com"
        url.path = "/authorize"
        url.scheme = "https"
        url.queryItems = [URLQueryItem(name: "client_id", value: "7822904"),
                          URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                          URLQueryItem(name: "display", value: "mobile"),
                          URLQueryItem(name: "scope", value: "270342"),
                          URLQueryItem(name: "response_type", value: "token"),
                          URLQueryItem(name: "revoke", value: "1"),
                          URLQueryItem(name: "v", value: "5.68")]
                          
        let request = URLRequest(url: url.url!)
        print(request)
        webView.load(request)
        
    }
    
    func configureWebView() {
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view.addSubview(webView)
        
    }
}

extension AuthController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
    
        guard let url = navigationResponse.response.url , url.path == "/blank.html"
        else {
            decisionHandler(.allow)
           
            return
        }
        
        let params = url.fragment?.components(separatedBy: "&").map{$0.components(separatedBy: "=")}.reduce([String: String](), { result, item in
        var dict = result
            let key = item[0]
            let value = item[1]
            dict[key] = value
            return dict
        
        })
        
        guard let token = params?["access_token"], let userId = params?["user_id"]
        else  {
            return
        }
        Session.shared.accesToken = token
        Session.shared.userID = userId
        
        let mainTabBarController = MainTabBarController()
        
        navigationController?.pushViewController(mainTabBarController , animated: true)
        decisionHandler(.cancel)
    }
}
