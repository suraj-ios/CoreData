//
//  AppDelegate.swift
//  CoreDataDemo
//
//  Created by Suraj on 11/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        CoreDataStack.sharedInstance.saveContext()
        
        return true
    }
    
}

