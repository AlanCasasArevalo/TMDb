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

    let appAssembly = AppAssembly()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        
        let featureVC =  FeaturedViewController(featurePresenter: appAssembly.coreAssembly.featureAssembly.featuredPresenter(), cardPresenter: appAssembly.coreAssembly.featureAssembly.cardPresenter())
        
        appAssembly.window.rootViewController = appAssembly.navigationController
        appAssembly.navigationController.pushViewController(featureVC, animated: false)
        appAssembly.window.makeKeyAndVisible()
        
        return true
    }

}

