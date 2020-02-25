//
//  AppDelegate.swift
//  TorusSDKExample
//
//  Created by Le Xuan Manh on 2/25/20.
//  Copyright © 2020 Le Xuan Manh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let userAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/603.1.23 (KHTML, like Gecko) Version/10.0 Mobile/14E5239e Safari/602"
    UserDefaults.standard.register(defaults: ["UserAgent": userAgent])
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = UINavigationController(rootViewController: ViewController())
    self.window = window
    window.makeKeyAndVisible()
    return true
  }

}
