//
//  OverviewNavBar.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 13.12.2022.
//

import UIKit

final class OverviewNavBar: WABaseView {
    private let titleLabel = UILabel()
    private let allWorkoutsButton: WAButton = {
        let button = WAButton(with: .secondary)
        button.setTitle(R.Strings.Overview.allWorkoutButton)
        return button
    }()
    private let addButton = UIButton()
    private let weekView = WeekView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addBottomBorder(with: R.Colors.separator, height: 1)
    }
    
    func addAllWorkoutAction(_ action: Selector, with target: Any?){
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    func addAdditingAction(_ action: Selector, with target: Any?){
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension OverviewNavBar {
    override func setupViews() {
        super.setupViews()
        setupView(titleLabel)
        setupView(allWorkoutsButton)
        setupView(addButton)
        setupView(weekView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            
            titleLabel.centerYAnchor.constraint(equalTo: allWorkoutsButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .white
        
        titleLabel.text = R.Strings.NavBar.overview
        titleLabel.textColor = R.Colors.titleGray
        titleLabel.font = R.Fonts.helveticaRegular(with: 22)
        
        addButton.setImage(R.Images.Common.plusButton, for: .normal)
        addButton.tintColor = .white
        addButton.backgroundColor = R.Colors.active
        addButton.layer.cornerRadius = 14
    }
}

@objc extension OverviewNavBar {
    func allWorkoutsButtonAction(){
        print("Wo Butt")
    }
    func addButtonAction(){
        print("Wo Butt")
    }
}
