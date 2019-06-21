//
//  AppDelegate.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 21/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let VC = UINavigationController(rootViewController: CompaniesViewController())
    
    window?.rootViewController = VC
    window?.makeKeyAndVisible()
    
    return true
  }
}

