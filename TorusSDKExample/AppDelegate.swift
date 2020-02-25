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
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = UINavigationController(rootViewController: ViewController())
    self.window = window
    window.makeKeyAndVisible()
    return true
  }

}
