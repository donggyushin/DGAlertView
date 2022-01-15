# DGAlertView
A simple custom popup dialog view for iOS written in Swift. Replaces UIAlertController alert style.

<div>
<img src="https://user-images.githubusercontent.com/34573243/149630644-fd09960f-2794-4ca6-96b6-c896143aa9bb.gif" width=250 />
</div>

## Requirements
- iOS 12.0+
- Swift 5.5+
- Xcode 10.0+


## Installation

### SPM
```
File > Add Packages > https://github.com/donggyushin/DGAlertView
```

### CocoaPod
```
pod 'DGAlertView', :git => 'https://github.com/donggyushin/DGAlertView'
```

## Usage
```
func showAlert() {
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false

        // Make sure give view height anyway
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return view
    }()

    let vc = DGAlertView(view)

    // Make sure animated false
    present(vc, animated: false)
}

// Hide DGAlertView programmatically
let vc = DGAlertView(view)
vc.hide()
    
```



