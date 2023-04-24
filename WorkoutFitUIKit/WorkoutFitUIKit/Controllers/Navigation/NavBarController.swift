//
//  NavBarController.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 09.12.2022.
//

import UIKit

final class NavBarController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: R.Colors.titleGray,
            .font: R.Fonts.helveticaRegular(with: 17)
        ]
        
        navigationBar.addBottomBorder(with: R.Colors.separator, height: 1)
    }
}
