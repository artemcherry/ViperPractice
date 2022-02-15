//
//  AppDelegate.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 14.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()

        let assemblyBuilder = AssemblyBuilder()
        let navController = UINavigationController()
        let router = Router(assemblyBuilder: assemblyBuilder, navController: navController)
        
        guard let rootVC = assemblyBuilder.createPictureListModule(router: router) else { return false }
        navController.viewControllers = [rootVC]
        
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

