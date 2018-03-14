//
//  AppDelegate.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 09/03/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController()
        let peopleVC = SLVPeopleVC()
        navigationController.pushViewController(peopleVC, animated:true)
	//	navigationController.navigationBar.isHidden = true
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
		
        return true
    }

}

