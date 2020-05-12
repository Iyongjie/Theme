//
//  NPTabbarController.swift
//  Theme
//
//  Created by 李永杰 on 2020/5/12.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import SwiftTheme

class NPTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13, *) {
            let currentUserInterfaceStyle = UITraitCollection.current.userInterfaceStyle
            guard currentUserInterfaceStyle != previousTraitCollection?.userInterfaceStyle else {
                return
            }
            let color = UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    NPThemes.switchTo(.night)
                    print("监听--暗黑模式")
                    return .black
                } else {
                    NPThemes.switchTo(.normal)
                    print("监听--正常模式")
                    return .white
                }
            }
            self.view.backgroundColor = color
        } else {
            print("不是iOS 13 ，不用适配暗黑模式")
        }
    }

}
