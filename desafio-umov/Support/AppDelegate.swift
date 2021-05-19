//
//  AppDelegate.swift
//  desafio-umov
//
//  Created by João on 18/05/21.
//  Copyright © 2021 João. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewModel = PrincipalViewModel()
        let controller = PrincipalViewController(viewModel: viewModel)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        
        return true
    }

}

