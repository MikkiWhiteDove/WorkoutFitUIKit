//
//  ViewController.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 09.12.2022.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        layoutViews()
        configureAppearance()
    }
}

@objc extension BaseController {
    func addViews() {}
    func layoutViews() {}
    func configureAppearance() {
        view.backgroundColor = R.Colors.backgroundColor
    }
    func navBarLeftButtonHendler() {
        print("1")
    }
    
    func navBarRightButtonHendler() {
        print("2")
    }
}

extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(R.Colors.active, for: .normal)
        button.setTitleColor(R.Colors.inActive, for: .disabled)
        button.titleLabel?.font = R.Fonts.helveticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHendler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHendler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func setTitleForNavBarButton(_ title: String, at position: NavBarPosition) {
        switch position {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }
        
        view.layoutIfNeeded()
    }
}
