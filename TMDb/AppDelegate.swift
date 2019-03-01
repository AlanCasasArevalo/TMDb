//
//  AppDelegate.swift
//  TMDb
//
//  Created by Alan Casas on 28/02/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit
import APP_Core

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.cyan
        
        let navController = UINavigationController(rootViewController: UIViewController())
        window?.rootViewController = navController
        
        return true
    }

}

