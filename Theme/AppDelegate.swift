//
//  AppDelegate.swift
//  Theme
//
//  Created by 李永杰 on 2020/5/12.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configTheme()
        return true
    }
    
    func configTheme() {

        if #available(iOS 13, *) {
            let style = UITraitCollection.current.userInterfaceStyle
            if style == .dark {
                NPThemes.switchTo(.night)
            } else {
                NPThemes.switchTo(.normal)
            }
        } else {
            print("不是iOS 13 ，不用适配暗黑模式")
        }
    }
}
