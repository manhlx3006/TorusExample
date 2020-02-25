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

  @IBOutlet weak var webView: WKWebView!

  override func viewDidLoad() {
      super.viewDidLoad()
      guard let localFilePath = Bundle.main.url(forResource: "index", withExtension: "html") else { return }
      let request = NSURLRequest(url: localFilePath)
      self.webView.load(request as URLRequest)
  }
}
