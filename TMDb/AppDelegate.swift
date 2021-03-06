//
//  AppDelegate.swift
//  TMDb
//
//  Created by Alan Casas on 28/02/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appAssembly = AppAssembly()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let initialVC = appAssembly.coreAssembly.featureAssembly.viewController()
        appAssembly.window.rootViewController = appAssembly.navigationController
        appAssembly.navigationController.pushViewController(initialVC, animated: false)
        appAssembly.window.makeKeyAndVisible()
        
        return true
    }

}

