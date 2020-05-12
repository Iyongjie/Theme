//
//  ViewController.swift
//  Theme
//
//  Created by 李永杰 on 2020/5/12.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count: Int = 0
    
    lazy var testLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 50))
        label.theme_backgroundColor = "ViewController.testLabel.backgroundColor"
        label.theme_textColor = "ViewController.testLabel.textColor"
        label.textAlignment = .center
        label.text = "手动/自动切换主题"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.theme_backgroundColor = "ViewController.backgroundColor"
        self.view.addSubview(self.testLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        count += 1
        let index = count % 2
        let theme = index == 0 ? NPThemes.normal : .night
        NPThemes.switchTo(theme)
    }
    
 
}

