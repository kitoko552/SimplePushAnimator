# SimplePushAnimator
Push transition without UINavigationController.

![Preview](http://f.st-hatena.com/images/fotolife/k/kitoko552/20150622/20150622202413.gif)

# Usage
```swift
class ViewController: UIViewController {
    private var transitioner: Transitioner?

    override func viewDidLoad() {
        super.viewDidLoad()
        transitioner = Transitioner(style: .SimplePush, viewController: self)
    }
}
```

You can see the sample project under the Sample directory.

# Requirement
iOS8.0+

# License
The MIT License
