//
//  SettingsController.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 09.12.2022.
//

import UIKit

class SettingsController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.Strings.NavBar.settings
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .settings)
        
    }
}
