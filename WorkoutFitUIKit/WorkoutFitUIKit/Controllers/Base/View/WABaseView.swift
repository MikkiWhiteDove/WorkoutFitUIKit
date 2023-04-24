//
//  WABaseView.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 13.12.2022.
//

import UIKit

class WABaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension WABaseView {
    func setupViews(){}
    func constraintViews() {}
    func configureAppearance() {
        backgroundColor = .white
    }
}
