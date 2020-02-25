//
//  ViewController.swift
//  TorusSDKExample
//
//  Created by Le Xuan Manh on 2/25/20.
//  Copyright © 2020 Le Xuan Manh. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

  var webView: WKWebView!
  var popupWebView: WKWebView?

  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupWebView()
    self.loadWebView()
  }

  func setupWebView() {
    let preferences = WKPreferences()
    preferences.javaScriptEnabled = true
    preferences.javaScriptCanOpenWindowsAutomatically = true

    let configuration = WKWebViewConfiguration()
    configuration.preferences = preferences
    
    self.webView = WKWebView(frame: view.bounds, configuration: configuration)
    self.webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.webView.uiDelegate = self
    self.webView.navigationDelegate = self
    
    self.view.addSubview(webView)

    self.navigationItem.leftBarButtonItem = UIBarButtonItem(
      title: "Back", style: .plain, target: self, action: #selector(self.goBack(_:)))
  }
  
  func loadWebView() {
    guard let localFilePath = Bundle.main.url(forResource: "index", withExtension: "html") else { return }
    let request = NSURLRequest(url: localFilePath)
    self.webView.load(request as URLRequest)
  }

  @objc func goBack(_ sender: Any?) {
    self.popupWebView?.removeFromSuperview()
    self.loadWebView()
  }
}

extension ViewController: WKUIDelegate {
  func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
      self.popupWebView = WKWebView(frame: view.bounds, configuration: configuration)
      self.popupWebView!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      self.popupWebView!.navigationDelegate = self
      self.popupWebView!.uiDelegate = self
      self.view.addSubview(self.popupWebView!)
      return self.popupWebView!
  }

  func webViewDidClose(_ webView: WKWebView) {
      webView.removeFromSuperview()
      self.popupWebView = nil
  }
}

extension ViewController: WKNavigationDelegate {
  open func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
      UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }
}
