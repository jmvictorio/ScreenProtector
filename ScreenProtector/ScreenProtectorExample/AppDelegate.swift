//
//  AppDelegate.swift
//  ScreenProtector
//
//  Created by jvictorio on 05/02/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit
import ScreenProtector

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        window!.makeKeyAndVisible()
        
        ScreenProtector.shared.prepare()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        showPreview()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        hidePreview()
    }
    
    func showPreview(){
        ScreenProtector.shared.showProtector()
    }
    
    func hidePreview(){
        ScreenProtector.shared.hideProtector()
    }
}
