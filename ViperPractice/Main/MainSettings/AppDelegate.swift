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
        let router = Router(assemblyBuilder: assemblyBuilder)
        
        guard let rootVC = assemblyBuilder.createPictureListModule(router: router) else { return false }
        
        self.window?.rootViewController = UINavigationController(rootViewController: rootVC)
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

