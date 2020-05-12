## iOS主题切换方案  
* 感谢开源[SwiftTheme](https://github.com/wxxsw/SwiftTheme)  
需要适配主题的UI组件，我们就不要使用系统的textColor、backgroundColor这些了，需要加上theme_前缀
* [SwiftTheme](https://github.com/wxxsw/SwiftTheme)  有几种方案可选，Index mode，Plist mode，Json mode。当app对主题要求不高，仅仅适配暗黑模式，我们可以使用Index mode，当app对主题要求高，尤其是多种动态主题切换，我们可以使用Plist和Json mode，这里我使用了Json mode  

## eg:  

### Index mode 

``` 
	view.theme_backgroundColor = ThemeColorPicker(colors: "#FFF", "#000")
	
	view.theme_image = ThemeImagePicker(names: "day", "night")
	
	ThemeManager.setTheme(index: 0)		
	
	ThemeManager.setTheme(index: 1) 	
```

### Json mode

``` 
label.theme_backgroundColor = "ViewController.testLabel.backgroundColor"        
label.theme_textColor = "ViewController.testLabel.textColor"
ThemeManager.setTheme(jsonName: "Normal_theme", path: .mainBundle)
```
## 两点完成主题切换
* 进app加载配置文件

```
configTheme()
```

* 监听系统主题模式切换

```
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
```